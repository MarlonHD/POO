class Produto {
  String nome;
  double preco;

  Produto({required this.nome, required this.preco});

  void disp() {
    print("Produto: $nome \nPreco: $preco");
  }
}

class Item {
  Produto produto;
  double quantidade;

  Item({required this.produto, required this.quantidade});

  double total() => this.produto.preco * this.quantidade;

  void disp() {
    this.produto.disp();
    double val = this.total();
    print("Quantidade: $quantidade \nValor: $val\n");
  }
}

class Venda {
  String data;
  List<Item> itens;

  Venda({required this.data, required this.itens});

  double total() => this.itens.fold(0,(sum,e) => sum + e.total());
  
  void disp() {
    var val = this.total();
    this.itens.forEach((e) => e.disp());
    print("Data: $data \nValor Total: $val");
  }
}
void main() {
  Produto prod1 = Produto(nome: 'Agua', preco: 1.50);
  Produto prod2 = Produto(nome: 'Pitu', preco: 7.50);

  Item item1 = Item(produto: prod1, quantidade: 3);
  Item item2 = Item(produto: prod2, quantidade: 2);

  Venda venda = Venda(data: "13/03/2023", itens: [item1, item2]);
  venda.disp();
}