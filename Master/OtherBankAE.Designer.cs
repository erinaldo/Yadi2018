﻿namespace Yadi.Master
{
    partial class OtherBankAE
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnNew = new System.Windows.Forms.Button();
            this.btnSearch = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnNext = new System.Windows.Forms.Button();
            this.btnPrev = new System.Windows.Forms.Button();
            this.btnLast = new System.Windows.Forms.Button();
            this.btnFirst = new System.Windows.Forms.Button();
            this.txtBabkName = new System.Windows.Forms.TextBox();
            this.chkActive = new System.Windows.Forms.CheckBox();
            this.BtnExit = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.lblChkHelp = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.btnUpdate = new System.Windows.Forms.Button();
            this.BtnSave = new System.Windows.Forms.Button();
            this.EP = new System.Windows.Forms.ErrorProvider(this.components);
            this.pnlMain = new OMControls.OMBPanel();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.EP)).BeginInit();
            this.pnlMain.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(99, 110);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(80, 60);
            this.btnCancel.TabIndex = 5;
            this.btnCancel.Text = "&Cancel";
            this.btnCancel.UseVisualStyleBackColor = false;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnNew
            // 
            this.btnNew.Location = new System.Drawing.Point(16, 111);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(80, 60);
            this.btnNew.TabIndex = 3;
            this.btnNew.Text = "&New";
            this.btnNew.UseVisualStyleBackColor = true;
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // btnSearch
            // 
            this.btnSearch.Location = new System.Drawing.Point(182, 111);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(80, 60);
            this.btnSearch.TabIndex = 6;
            this.btnSearch.Text = "Searc&h";
            this.btnSearch.UseVisualStyleBackColor = true;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.Location = new System.Drawing.Point(265, 111);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(80, 60);
            this.btnDelete.TabIndex = 7;
            this.btnDelete.Text = "&Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnNext
            // 
            this.btnNext.Location = new System.Drawing.Point(96, 177);
            this.btnNext.Name = "btnNext";
            this.btnNext.Size = new System.Drawing.Size(37, 27);
            this.btnNext.TabIndex = 11;
            this.btnNext.Text = ">";
            this.btnNext.UseVisualStyleBackColor = true;
            this.btnNext.Click += new System.EventHandler(this.btnNext_Click);
            // 
            // btnPrev
            // 
            this.btnPrev.Location = new System.Drawing.Point(56, 177);
            this.btnPrev.Name = "btnPrev";
            this.btnPrev.Size = new System.Drawing.Size(37, 27);
            this.btnPrev.TabIndex = 10;
            this.btnPrev.Text = "<";
            this.btnPrev.UseVisualStyleBackColor = true;
            this.btnPrev.Click += new System.EventHandler(this.btnPrev_Click);
            // 
            // btnLast
            // 
            this.btnLast.Location = new System.Drawing.Point(136, 177);
            this.btnLast.Name = "btnLast";
            this.btnLast.Size = new System.Drawing.Size(37, 27);
            this.btnLast.TabIndex = 12;
            this.btnLast.Text = ">|";
            this.btnLast.UseVisualStyleBackColor = true;
            this.btnLast.Click += new System.EventHandler(this.btnLast_Click);
            // 
            // btnFirst
            // 
            this.btnFirst.Location = new System.Drawing.Point(16, 177);
            this.btnFirst.Name = "btnFirst";
            this.btnFirst.Size = new System.Drawing.Size(37, 27);
            this.btnFirst.TabIndex = 9;
            this.btnFirst.Text = "|<";
            this.btnFirst.UseVisualStyleBackColor = true;
            this.btnFirst.Click += new System.EventHandler(this.btnFirst_Click);
            // 
            // txtBabkName
            // 
            this.txtBabkName.Location = new System.Drawing.Point(140, 10);
            this.txtBabkName.Name = "txtBabkName";
            this.txtBabkName.Size = new System.Drawing.Size(236, 20);
            this.txtBabkName.TabIndex = 1;
            this.txtBabkName.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtBabkName_KeyDown);
           // this.txtBabkName.Leave += new System.EventHandler(this.txtBranchName_Leave);
            // 
            // chkActive
            // 
            this.chkActive.AutoSize = true;
            this.chkActive.Location = new System.Drawing.Point(140, 48);
            this.chkActive.Name = "chkActive";
            this.chkActive.Size = new System.Drawing.Size(44, 17);
            this.chkActive.TabIndex = 2;
            this.chkActive.Text = "Yes";
            this.chkActive.UseVisualStyleBackColor = true;
            this.chkActive.CheckedChanged += new System.EventHandler(this.chkActive_CheckedChanged);
            this.chkActive.KeyDown += new System.Windows.Forms.KeyEventHandler(this.chkActive_KeyDown);
            // 
            // BtnExit
            // 
            this.BtnExit.Location = new System.Drawing.Point(348, 111);
            this.BtnExit.Name = "BtnExit";
            this.BtnExit.Size = new System.Drawing.Size(80, 60);
            this.BtnExit.TabIndex = 8;
            this.BtnExit.Text = "Exit";
            this.BtnExit.UseVisualStyleBackColor = true;
            this.BtnExit.Click += new System.EventHandler(this.BtnExit_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(24, 50);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(76, 13);
            this.label3.TabIndex = 17;
            this.label3.Text = "Active Status :";
            // 
            // panel1
            // 
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.lblChkHelp);
            this.panel1.Controls.Add(this.txtBabkName);
            this.panel1.Controls.Add(this.chkActive);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Location = new System.Drawing.Point(16, 18);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(412, 84);
            this.panel1.TabIndex = 0;
            // 
            // lblChkHelp
            // 
            this.lblChkHelp.AutoSize = true;
            this.lblChkHelp.Location = new System.Drawing.Point(186, 48);
            this.lblChkHelp.Name = "lblChkHelp";
            this.lblChkHelp.Size = new System.Drawing.Size(215, 13);
            this.lblChkHelp.TabIndex = 190042;
            this.lblChkHelp.Text = "( Press SPACE BAR or cilck using MOUSE )";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(24, 14);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(41, 13);
            this.label1.TabIndex = 15;
            this.label1.Text = "Name :";
            // 
            // btnUpdate
            // 
            this.btnUpdate.Location = new System.Drawing.Point(100, 110);
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(80, 60);
            this.btnUpdate.TabIndex = 4;
            this.btnUpdate.Text = "Update";
            this.btnUpdate.UseVisualStyleBackColor = false;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // BtnSave
            // 
            this.BtnSave.Location = new System.Drawing.Point(17, 110);
            this.BtnSave.Name = "BtnSave";
            this.BtnSave.Size = new System.Drawing.Size(80, 60);
            this.BtnSave.TabIndex = 3;
            this.BtnSave.Text = "Save";
            this.BtnSave.UseVisualStyleBackColor = true;
            this.BtnSave.Click += new System.EventHandler(this.BtnSave_Click);
            // 
            // EP
            // 
            this.EP.ContainerControl = this;
            // 
            // pnlMain
            // 
            this.pnlMain.BorderColor = System.Drawing.Color.Gray;
            this.pnlMain.BorderRadius = 3;
            this.pnlMain.Controls.Add(this.panel1);
            this.pnlMain.Controls.Add(this.btnSearch);
            this.pnlMain.Controls.Add(this.btnDelete);
            this.pnlMain.Controls.Add(this.btnNext);
            this.pnlMain.Controls.Add(this.btnCancel);
            this.pnlMain.Controls.Add(this.btnPrev);
            this.pnlMain.Controls.Add(this.BtnSave);
            this.pnlMain.Controls.Add(this.btnLast);
            this.pnlMain.Controls.Add(this.BtnExit);
            this.pnlMain.Controls.Add(this.btnFirst);
            this.pnlMain.Controls.Add(this.btnNew);
            this.pnlMain.Controls.Add(this.btnUpdate);
            this.pnlMain.Location = new System.Drawing.Point(21, 24);
            this.pnlMain.Name = "pnlMain";
            this.pnlMain.Size = new System.Drawing.Size(447, 213);
            this.pnlMain.TabIndex = 66;
            // 
            // OtherBankAE
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(487, 251);
            this.Controls.Add(this.pnlMain);
            this.Name = "OtherBankAE";
            this.Text = "Bank Master";
            this.Load += new System.EventHandler(this.OtherBankAE_Load);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.OtherBankAE_FormClosing);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.EP)).EndInit();
            this.pnlMain.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnNew;
        private System.Windows.Forms.Button btnSearch;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnNext;
        private System.Windows.Forms.Button btnPrev;
        private System.Windows.Forms.Button btnLast;
        private System.Windows.Forms.Button btnFirst;
        private System.Windows.Forms.TextBox txtBabkName;
        private System.Windows.Forms.CheckBox chkActive;
        private System.Windows.Forms.Button BtnExit;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnUpdate;
        private System.Windows.Forms.Button BtnSave;
        private System.Windows.Forms.ErrorProvider EP;
        private OMControls.OMBPanel pnlMain;
        private System.Windows.Forms.Label lblChkHelp;

    }
}