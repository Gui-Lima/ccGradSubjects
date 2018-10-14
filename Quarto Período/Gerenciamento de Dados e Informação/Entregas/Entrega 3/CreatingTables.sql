
DROP TABLE Telefone PURGE;
CREATE TABLE Telefone(
    id VARCHAR2(15) NOT NULL,
    -- phone VARCHAR2(15) NOT NULL,

    CONSTRAINT telefone_pk PRIMARY KEY(id)
);
 
ALTER TABLE Telefone ADD (phone VARCHAR2(15) NOT NULL)

-------------------------------------------------------------------------------------------------------------

DROP TABLE Endereco CASCADE CONSTRAINTS;
CREATE TABLE Endereco (
   CEP     VARCHAR2(9) NOT NULL UNIQUE,
   Rua     VARCHAR2(50) NOT NULL,
   Numero  NUMBER NOT NULL,
   Cidade  VARCHAR2(50) NOT NULL,
   Estado  VARCHAR2(50) NOT NULL,
   Id      VARCHAR2(15) NOT NULL,

   CONSTRAINT endereco_pk PRIMARY KEY (Id)
);

----------------------------------------------------------------------------------------------------------------------

DROP TABLE Pessoa CASCADE CONSTRAINTS;
CREATE TABLE Pessoa (
   CPF         VARCHAR2(18) NOT NULL,
   Nome        VARCHAR2(50) NOT NULL,
   Sexo        CHAR NOT NULL,
   DataNasc    VARCHAR2(10) NOT NULL,
   Id_end      VARCHAR2(15) NOT NULL,

   CONSTRAINT pessoa_pk PRIMARY KEY (CPF),
   CONSTRAINT pessoa_cep_fk FOREIGN KEY (Id_end) REFERENCES Endereco(CEP),
   CONSTRAINT pessoa_sexo_ck CHECK (sexo = 'M' OR sexo = 'F' OR sexo = '0')
);


-----------------------------------------------------------------------------------------------------------


DROP TABLE Funcionario CASCADE CONSTRAINTS;
CREATE TABLE Funcionario (
  CPF_f       VARCHAR2(18) NOT NULL,
  CarteiraTrabalho VARCHAR2(30) NOT NULL,
  Salario     NUMBER,

  CONSTRAINT funcionario_pk PRIMARY KEY (CPF_f),
  CONSTRAINT funcionario_CPF_fk FOREIGN KEY (CPF_f) REFERENCES Pessoa(CPF)
);

--------------------------------------------------------------------------------------------------------------


DROP TABLE Cliente CASCADE CONSTRAINTS;
CREATE TABLE Cliente (
   CPF_p               VARCHAR2(18) NOT NULL,
   Email               VARCHAR2(50),
   DataRegistro        VARCHAR2(10) NOT NULL,

   CONSTRAINT cliente_pk PRIMARY KEY (CPF_p),
   CONSTRAINT cliente_fk FOREIGN KEY (CPF_p) REFERENCES Pessoa(CPF)
);


--------------------------------------------------------------------------------------------------------------

DROP TABLE Medicamento CASCADE CONSTRAINTS;
CREATE TABLE Medicamento (
   Codigo      VARCHAR2(25) NOT NULL,
   Nome        VARCHAR2(50) NOT NULL,

   CONSTRAINT medicamento_pk PRIMARY KEY (Codigo)
);

------------------------------------------------------------------------------------------------------------------------

DROP TABLE Procedimento CASCADE CONSTRAINTS;
CREATE TABLE Procedimento (
   Codigo          VARCHAR2(25) NOT NULL,
   Nome            VARCHAR(50) NOT NULL,
   Descricao       VARCHAR(100) NOT NULL,

   CONSTRAINT procedimento_pk PRIMARY KEY(Codigo)
);
-------------------------------------------------------------------------------

DROP TABLE Pet CASCADE CONSTRAINTS;
CREATE TABLE Pet (
   CPF_c       VARCHAR2(18) NOT NULL,
   Nome        VARCHAR2(50) NOT NULL,
   Raca        VARCHAR2(25) NOT NULL,
   Especie     VARCHAR2(10) NOT NULL,
   Idade       NUMBER,
   Sexo        CHAR,

   CONSTRAINT pet_pk PRIMARY KEY (CPF_c, Nome),
   CONSTRAINT pet_fk FOREIGN KEY (CPF_c) REFERENCES Cliente(CPF_p),
   CONSTRAINT pet_sexo_ck CHECK (sexo = 'M' OR sexo = 'F' or sexo = '0')
);

-----------------------------------------------------------------------------------------------------------------------
DROP TABLE Veterinario CASCADE CONSTRAINTS;
CREATE TABLE Veterinario (
  CPF_f       VARCHAR2(18) NOT NULL,
  CRMV        VARCHAR2(20) NOT NULL,

  CONSTRAINT veterinario_pk PRIMARY KEY (CPF_f),
  CONSTRAINT veterinario_CPF_f_fk FOREIGN KEY (CPF_f) REFERENCES Funcionario(CPF_f)
);


--------------------------------------------------------------------------------------------------------------------------
DROP TABLE Auxiliar CASCADE CONSTRAINTS;

CREATE TABLE Auxiliar (
  CPF_a  VARCHAR2(18) NOT NULL,
  CPF_chefe  VARCHAR2(18),
  CARGO VARCHAR2(50) NOT NULL,


  CONSTRAINT auxiliar_pk PRIMARY KEY (CPF_a),
  CONSTRAINT auxiliar_cpf_f_fk FOREIGN KEY (CPF_a) REFERENCES Funcionario(CPF_f),
  CONSTRAINT auxiliar_cpf_chefe_fk FOREIGN KEY (CPF_chefe) REFERENCES Auxiliar(CPF_a)
);


--------------------------------------------------------------------------------------------
DROP TABLE PetVeterinario CASCADE CONSTRAINTS;

CREATE TABLE PetVeterinario(
   Id_Pet VARCHAR2(18) NOT NULL,
   Nome_Pet VARCHAR2(50) NOT NULL,
   CPF_Vet VARCHAR2(18) NOT NULL,
   DataEntrada VARCHAR2(10) NOT NULL,

   CONSTRAINT  petvet_id_pet_pk PRIMARY KEY (Id_Pet, Nome_pet, CPF_Vet, DataEntrada),
   CONSTRAINT  petvet_id_pet_fk FOREIGN KEY (Id_Pet, Nome_Pet) REFERENCES Pet(CPF_c, Nome),
   CONSTRAINT  petvet_cpf_Vet_fk FOREIGN KEY (CPF_Vet) REFERENCES Veterinario(CPF_f)
);


-------------------------------------------------------------------------------------------------------------
DROP TABLE Realiza CASCADE CONSTRAINTS;

CREATE TABLE Realiza (

    Codigo_p VARCHAR2(50) NOT NULL,
    CPF_p VARCHAR2(50) NOT NULL,
    Nome_p VARCHAR2(50) NOT NULL,
    DataMarcada VARCHAR(10) NOT NULL,
    CPF_a VARCHAR(20) NOT NULL,
    
    CONSTRAINT realiza_pk PRIMARY KEY (Codigo_p, CPF_p, Nome_p, DataMarcada),
    CONSTRAINT realiza_codigo_fk FOREIGN KEY (Codigo_p) REFERENCES Procedimento(Codigo),
    CONSTRAINT realiza_pet_fk FOREIGN KEY (CPF_p, Nome_p) REFERENCES Pet(CPF_c, Nome)
);

---------------------------------------------------------------------------------------------------------------------------
DROP TABLE Solicita CASCADE CONSTRAINTS;

CREATE TABLE Solicita(
   Veterinario VARCHAR2(18) NOT NULL,
   Procedimento VARCHAR2(18) NOT NULL,
   
   CONSTRAINT  solicita_veterinario_pk PRIMARY KEY (Veterinario, Procedimento),
   CONSTRAINT  solicita_veterinario_fk FOREIGN KEY (Veterinario) REFERENCES Veterinario(CPF_f),
   CONSTRAINT  solicita_procedimento_fk FOREIGN KEY (Procedimento) REFERENCES Procedimento(Codigo)
);


--------------------------------------------------------------------------------------

DROP TABLE Prescricao CASCADE CONSTRAINTS;
CREATE TABLE Prescricao(
    CPF_c VARCHAR2(20),
    Nome_p VARCHAR2(50),
    Cpf_v VARCHAR2(20),
    Data_pv VARCHAR2(11),
    Codigo_m VARCHAR2(20),
    
    CONSTRAINT prescricao_pk PRIMARY KEY (CPF_c, Nome_p, Cpf_v, Data_pv, Codigo_m),
    CONSTRAINT prescricao_petvet_fk FOREIGN KEY (CPF_c, Nome_p, Cpf_v, Data_pv) REFERENCES PetVeterinario(Id_Pet, Nome_Pet, CPF_Vet, DataEntrada),
    CONSTRAINT presicricao_cod_fk FOREIGN KEY (Codigo_m) REFERENCES Medicamento(Codigo)
);


----------------------------------------------------------------------------------

-- Sequence
CREATE SEQUENCE Sequencia
START WITH 1
INCREMENT BY 5
MINVALUE 0
MAXVALUE 100
CYCLE;

-- 


