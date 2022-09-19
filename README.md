# Form Validation with Mixin

Normalmente implementamos a validação de um `TextFormField` definindo uma lógica de validação no seu parâmetro 
`validator`.

```dart
final usernameFormField = TextFormField(
    decoration: const InputDecoration(hintText: 'Username'),
    validator: (value) {
      if (value == null || value == '') {
        return 'Enter your username.';
      }
      return null;
      },
    );
```

No código acima vemos que a lógica de validação da entrada do usuário está junto à propriedade `validator` com um if/else.

Um cenário em que temos vários formulários com a mesma lógica de validação para implementar, precisaríamos reescrever o
mesmo código.

Por exemplo, podemos ter um `Email TextFormField` na página de Login e na página de Sign Up. Usando a abordagem do 
código acima iríamos repetir a mesma lógica de validação da entrada para ambas as páginas.

Podemos reduzir essa duplicação de código criando uma lógica de validação e definindo-a em um `Mixin` separadamente.

**Mixins são uma maneira de reutilizar o código de uma classe em várias hierarquias de classe.**

Mixins, em outras palavras, são classes como já conhecemos mas que podemos **pegar seus métodos (ou variáveis) sem 
precisar herdá-los.** Para fazer isso, usamos a *keyword* `with`.

Para declarar um mixin, usamos a *keyword* `mixin`:
```dart
mixin MixinName {
  
}
```
Para entender melhor o mixin: [documentation](https://dart.dev/guides/language/language-tour#adding-features-to-a-class-mixins)

No código de exemplo, tem a implementação completa de como utilizar o mixin nesse cenário.