## Copyright (C) 2018 gabriel
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} algoritmo (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: gabriel <gabriel@GABOLENOVO>
## Created: 2018-03-11





function [] = algoritmo ()
  ## ----------REYES GABRIEL, BERMUDEZ ENRIQUE Y LEON JOHANGEL----------
  fprintf('\n');
  fprintf('Desea construir un grafo nuevo o utilizar uno existente? \n');
  fprintf('1- Grafo Nuevo \n');
  fprintf('2- Grafo Existente \n');
  opcion1 = input('Opcion: ');
  fprintf('\n');
  
  if (opcion1 == 1)
    fprintf('Ingrese los nodos del grafo en forma de matriz de adyacencia, \n');
    fprintf('indicando la distancia en cada celda, 0 si los nodos no se conectan \n');
    ej = [0 10 5 0 0 ; 0 0 2 1 0 ; 0 3 0 9 2 ; 0 0 0 0 4 ; 7 0 0 6 0];
    fprintf (' Ejemplo: [0 10 5 0 0 ; 0 0 2 1 0 ; 0 3 0 9 2 ; 0 0 0 0 4 ; 7 0 0 6 0] \n');
    ej
    fprintf ('\n');
    fprintf (' Grafo:\n');
    grafo = input(' ');
    grafo
    nodos = columns(grafo)
    fprintf ('\n');
    n_inicial = input('Seleccione el nodo inicial ');
    n_final = input('Seleccione el nodo final ');
    fprintf ('\n');
  else
    ## llamar grafo existente
  endif
  
  fprintf ("----------RESULTADOS---------- \n");
  visitado(1:nodos) = false;
  distancia(1:nodos) = inf;
  n_padre(1:nodos) = 0;
  distancia(n_inicial) = 0;
  cola = [];
  cola = [cola; n_inicial distancia(n_inicial)];
  while (rows(cola) > 0)
    [minval row] = min(cola(:,2));
    u = cola(row,:);
    cola(row,:) = [];
    visitado(u(1,1)) = true;
    vecinos = grafo(u(1,1),:);
    for i = 1:nodos
      if(vecinos(i) > 0)
        if(distancia(i) > distancia(u(1,1)) + vecinos(i));
          distancia(i) = distancia(u(1,1)) + vecinos(i);
          n_padre(i) = u(1,1);
          cola = [cola; i distancia(i)];
        endif
      endif
    endfor
  endwhile
  fprintf ("\n");
  fprintf ("La distancia mas corta para llegar a cada nodo partiendo desde el nodo inicial: \n");
  distancia
  fprintf ("\n");
  fprintf ("El camino a seguir para llegar al nodo n se conoce del siguiente vector \n");
  n_padre
  fprintf ("Para el nodo ");
  fprintf ("%i la ruta es la siguiente: \n",n_final);
  i = n_final;
  ruta = [n_final];
  while(n_padre(i) > 0)
    ruta = [ruta; n_padre(i)];
    aux2 = n_padre(i);
    i = aux2;
  endwhile
  ruta = ruta';
  rutaOrden = fliplr(ruta);
  rutaOrden
endfunction
