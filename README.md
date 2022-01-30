- menu button
    - bouncing button
    - image on right or left 


https://color.adobe.com/

bloc - separar regras da interface

um cubit serve para encapsular o estado da aplicação

exemplo de cubit :

class Incrementador extends Cubit<int>{
    Incrementador(): super(0)
    void incrementar -> emit(state + 1)
}

o estado começa em 0 e as funções chamam o emit para emitir uma informação como o incrementador

para usar um cubit a ideia é separar a classe da view em um novo statelessWidget chamado *Container* e o build delete retorna um BlocProvider dessa forma eu vou ter uma classe Stateless somente com:

return BlocProvider(
    create: (_)=> Incrementador(),
    child: CounterView()
)

daí para acessar dentro da CounterView é só chamar context.bloc<Incrementador>().incrementar()
outra forma de acessar um cubit é usando o BlocBuilder dessa forma, quando o emit é disparado
ele irá chamar os builder para redesenhar, exemplo de aplicação:

BlocBuilder<Incrementador, int>(builder(context,state){
    return Text("" + state)
})


é Possivel perder uma referência ao criar um novo context em um roteamento de páginas, para evitar isso é possível extrair o valor do bloc de um context para outro utilizando por exemplo do material route page:

MaterialRoutePage(
    builder:(context) => BlocProvider.value(
        value:BlocProvider.of<Incrementador>(contextAnterior),
        child: NomeContainer
    )
)

-- Sobre blocs

o cubit é uma instancia que recebe um estado inicial no construtor
o blocProvider adiciona o bloc a um widget filho
o BlocBuilder cria um Widget com base no cubit e rebuilda de acordo com os estados novos

-- cache local

instalar a biblioteca local_storage

-- Testes de Unidade: teste('descrição',(){})

-- Teste de widget: testWidgets('descrição',callback(){
    
})


-- Catálogo de widgets a ser utilizado

Snackbar
CircularProgressIndicator
BottomNavigationBar (talvez)