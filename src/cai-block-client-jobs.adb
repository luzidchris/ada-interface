package body Cai.Block.Client.Jobs with
   SPARK_Mode
is

   function Status (J : Job) return Job_Status
   is
   begin
      return J.Status;
   end Status;

   function Get_Client (J : Job) return Client_Instance
   is
   begin
      return J.Client;
   end Get_Client;

   function Get_Id (J : Job) return Job_Id
   is
   begin
      return Job_Id (J'Address);
   end Get_Id;

   function Create return Job
   is
   begin
      return Job'(Client    => Null_Client,
                  Kind      => None,
                  Status    => Raw,
                  Start     => 0,
                  Length    => 0,
                  Processed => 0);
   end Create;

   procedure Initialize (J      : in out Job;
                         C      :        Client_Session;
                         Kind   :        Request_Kind;
                         Start  :        Id;
                         Length :        Count)
   is
   begin
      J.Client    := Get_Instance (C);
      J.Kind      := Kind;
      J.Status    := Pending;
      J.Start     := Start;
      J.Length    := Length;
      J.Processed := 0;
   end Initialize;

   procedure Run (J : in out Job;
                  C : in out Client_Session)
   is
   begin
      null;
   end Run;

   procedure Read (J      : in out Job;
                   C      : in out Client_Session;
                   Data   :    out Buffer;
                   Length : in out Count;
                   Offset :        Count)
   is
   begin
      null;
   end Read;

   procedure Release (J : in out Job;
                      C : in out Client_Session)
   is
   begin
      null;
   end Release;

   procedure Checked_Write (Jid    :        Job_Id;
                            Bsize  :        Size;
                            Data   :    out Buffer;
                            Length : in out Count)
   is
   begin
      Write (Jid, Bsize, Data, Length);
   end Checked_Write;

end Cai.Block.Client.Jobs;
