from django.shortcuts import render, redirect, reverse
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from .models import Product, Category, Subscription
from datetime import datetime
from .filters import ProductFilter
from .forms import ProductForm
from django.urls import reverse_lazy
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.contrib.auth.decorators import login_required
from django.db.models import Exists, OuterRef
from django.views.decorators.csrf import csrf_protect


class ProductList(ListView):
    model = Product
    ordering = 'name'
    template_name = 'products.html'
    context_object_name = 'products'
    paginate_by = 3

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['time_now'] = datetime.utcnow()
        context['next_sale'] = 'Убрал строку None'
        context['filterset'] = self.filterset
        return context


    def get_queryset(self):
        queryset = super().get_queryset()
        self.filterset = ProductFilter(self.request.GET, queryset)
        return self.filterset.qs.order_by('id')


class ProductDetail(DetailView):
    model = Product
    template_name = 'product.html'
    context_object_name = 'product'


# def create_form(request):
#     if request.method == 'POST':
#         form = ProductForm(request.POST)
#         if form.is_valid():
#             form.save()
#             return redirect('/products/')
#     else:
#         form = ProductForm()
#
#     return render(request,'product_create.html', {'form': form})

# class CreateProduct(LoginRequiredMixin, CreateView):
class CreateProduct(PermissionRequiredMixin, CreateView):
    permission_required = ('simpleapp.add_product')
    raise_exception = True
    form_class = ProductForm
    model = Product
    template_name = 'product_create.html'


class UpdateProduct(PermissionRequiredMixin, UpdateView):
    permission_required = ('simpleapp.change_product')
    raise_exception = True
    form_class = ProductForm
    model = Product
    template_name = 'product_create.html'


class DeleteProduct(PermissionRequiredMixin,DeleteView):
    permission_required = ('simpleapp.delete_product')
    raise_exception = True
    model = Product
    template_name = 'product_delete.html'
    success_url = reverse_lazy('product_list')


@login_required
@csrf_protect
def subscription(request):
    if request.metod == "POST":
        category_id = request.POST.get('category_id')
        category=Category.objects.get(id=category_id)
        action = request.POST.get('action')

        if action == 'subscribe':
            Subscription.objects.create(user = request.user, category = category)
        elif action == 'unsubscribe':
            Subscription.objects.create(user=request.user, category=category).delete()

    categories_with_subscriptions = Category.objects.annotate(user_subscribed=Exists(Subscription.objects.filter(user=request.user, category=OuterRef('pk'),))).order_by('name')
    return render(request, 'subscribe.html', {'categories': categories_with_subscriptions})

