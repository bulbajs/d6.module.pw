def send_mail(subject, message, from_email, recipient_list):
    print("=== ОТПРАВКА ПИСЬМА ===")
    print(f"Тема НАШЕГО ПИСЬМА: {subject} ")
    print(f'{message}!!!')
    print(f'ДАБУДИ ДАБУДА {from_email}')
    print(f"Кому: {', '.join(recipient_list)}")
    print("=======================")

# Вызов функции
send_mail(
    subject="Добро пожаловать!",
    message="Вы успешно зарегистрировались!",
    from_email="admin@site.com",
    recipient_list=["test@example.com"]
)


