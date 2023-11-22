# Simulação

## Configuração A

``` mermaid

flowchart TB

subgraph host_1
    c1 --> c2
    c3 --> c4
end

```

## Configuração B

``` mermaid

flowchart LR

subgraph host_1
    c1
    c2
end

subgraph host_2
    c3
    c4
end

c1 --> c3
c2 --> c4

---

[Voltar](../Readme.md)
