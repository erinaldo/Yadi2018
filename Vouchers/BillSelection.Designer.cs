﻿namespace Yadi.Vouchers
{
    partial class BillSelection
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            this.pnlMain = new System.Windows.Forms.Panel();
            this.btnExit = new System.Windows.Forms.Button();
            this.dgBill = new System.Windows.Forms.DataGridView();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.GPKVoucherNo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.GBillNo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.GBillDate = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.GAmount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.GParty = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.panel2 = new System.Windows.Forms.Panel();
            this.rbSalesBillRawMaterial = new System.Windows.Forms.RadioButton();
            this.rbSalesBillJobWork = new System.Windows.Forms.RadioButton();
            this.rbSalesBillMaterial = new System.Windows.Forms.RadioButton();
            this.cmbParty = new System.Windows.Forms.ComboBox();
            this.lblParty = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.cmbFirmName = new System.Windows.Forms.ComboBox();
            this.pnlMain.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgBill)).BeginInit();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.btnExit);
            this.pnlMain.Controls.Add(this.dgBill);
            this.pnlMain.Controls.Add(this.panel2);
            this.pnlMain.Location = new System.Drawing.Point(12, 12);
            this.pnlMain.Name = "pnlMain";
            this.pnlMain.Size = new System.Drawing.Size(896, 512);
            this.pnlMain.TabIndex = 0;
            // 
            // btnExit
            // 
            this.btnExit.Location = new System.Drawing.Point(11, 485);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(75, 23);
            this.btnExit.TabIndex = 3;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // dgBill
            // 
            this.dgBill.AllowUserToAddRows = false;
            this.dgBill.AllowUserToDeleteRows = false;
            this.dgBill.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dgBill.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgBill.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column1,
            this.GPKVoucherNo,
            this.GBillNo,
            this.GBillDate,
            this.GAmount,
            this.GParty});
            this.dgBill.Location = new System.Drawing.Point(11, 78);
            this.dgBill.Name = "dgBill";
            this.dgBill.Size = new System.Drawing.Size(877, 402);
            this.dgBill.TabIndex = 2;
            this.dgBill.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dgBill_KeyDown);
            // 
            // Column1
            // 
            this.Column1.HeaderText = "SrNo";
            this.Column1.Name = "Column1";
            this.Column1.ReadOnly = true;
            this.Column1.Width = 55;
            // 
            // GPKVoucherNo
            // 
            this.GPKVoucherNo.HeaderText = "PKVoucherNo";
            this.GPKVoucherNo.Name = "GPKVoucherNo";
            this.GPKVoucherNo.Visible = false;
            // 
            // GBillNo
            // 
            this.GBillNo.HeaderText = "Bill No";
            this.GBillNo.Name = "GBillNo";
            this.GBillNo.ReadOnly = true;
            this.GBillNo.Width = 95;
            // 
            // GBillDate
            // 
            this.GBillDate.HeaderText = "Bill Date";
            this.GBillDate.Name = "GBillDate";
            this.GBillDate.ReadOnly = true;
            this.GBillDate.Width = 95;
            // 
            // GAmount
            // 
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            dataGridViewCellStyle5.Format = "N2";
            this.GAmount.DefaultCellStyle = dataGridViewCellStyle5;
            this.GAmount.HeaderText = "Amount";
            this.GAmount.Name = "GAmount";
            this.GAmount.ReadOnly = true;
            this.GAmount.Width = 120;
            // 
            // GParty
            // 
            this.GParty.HeaderText = "Party";
            this.GParty.Name = "GParty";
            this.GParty.ReadOnly = true;
            this.GParty.Width = 300;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.label3);
            this.panel2.Controls.Add(this.cmbFirmName);
            this.panel2.Controls.Add(this.rbSalesBillRawMaterial);
            this.panel2.Controls.Add(this.rbSalesBillJobWork);
            this.panel2.Controls.Add(this.rbSalesBillMaterial);
            this.panel2.Controls.Add(this.cmbParty);
            this.panel2.Controls.Add(this.lblParty);
            this.panel2.Location = new System.Drawing.Point(11, 8);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(877, 65);
            this.panel2.TabIndex = 0;
            // 
            // rbSalesBillRawMaterial
            // 
            this.rbSalesBillRawMaterial.AutoSize = true;
            this.rbSalesBillRawMaterial.Location = new System.Drawing.Point(295, 12);
            this.rbSalesBillRawMaterial.Name = "rbSalesBillRawMaterial";
            this.rbSalesBillRawMaterial.Size = new System.Drawing.Size(132, 17);
            this.rbSalesBillRawMaterial.TabIndex = 4;
            this.rbSalesBillRawMaterial.Text = "Sales Bill Raw Material";
            this.rbSalesBillRawMaterial.UseVisualStyleBackColor = true;
            this.rbSalesBillRawMaterial.Visible = false;
            this.rbSalesBillRawMaterial.CheckedChanged += new System.EventHandler(this.rb_CheckedChanged);
            // 
            // rbSalesBillJobWork
            // 
            this.rbSalesBillJobWork.AutoSize = true;
            this.rbSalesBillJobWork.Location = new System.Drawing.Point(147, 12);
            this.rbSalesBillJobWork.Name = "rbSalesBillJobWork";
            this.rbSalesBillJobWork.Size = new System.Drawing.Size(111, 17);
            this.rbSalesBillJobWork.TabIndex = 3;
            this.rbSalesBillJobWork.Text = "Sale Bill Job Work";
            this.rbSalesBillJobWork.UseVisualStyleBackColor = true;
            this.rbSalesBillJobWork.Visible = false;
            this.rbSalesBillJobWork.CheckedChanged += new System.EventHandler(this.rb_CheckedChanged);
            // 
            // rbSalesBillMaterial
            // 
            this.rbSalesBillMaterial.AutoSize = true;
            this.rbSalesBillMaterial.Checked = true;
            this.rbSalesBillMaterial.Location = new System.Drawing.Point(13, 12);
            this.rbSalesBillMaterial.Name = "rbSalesBillMaterial";
            this.rbSalesBillMaterial.Size = new System.Drawing.Size(70, 17);
            this.rbSalesBillMaterial.TabIndex = 222;
            this.rbSalesBillMaterial.TabStop = true;
            this.rbSalesBillMaterial.Text = "Sales Bill ";
            this.rbSalesBillMaterial.UseVisualStyleBackColor = true;
            this.rbSalesBillMaterial.CheckedChanged += new System.EventHandler(this.rb_CheckedChanged);
            // 
            // cmbParty
            // 
            this.cmbParty.FormattingEnabled = true;
            this.cmbParty.Location = new System.Drawing.Point(459, 39);
            this.cmbParty.Name = "cmbParty";
            this.cmbParty.Size = new System.Drawing.Size(415, 21);
            this.cmbParty.TabIndex = 1;
            this.cmbParty.KeyDown += new System.Windows.Forms.KeyEventHandler(this.cmbParty_KeyDown);
            // 
            // lblParty
            // 
            this.lblParty.AutoSize = true;
            this.lblParty.Location = new System.Drawing.Point(405, 42);
            this.lblParty.Name = "lblParty";
            this.lblParty.Size = new System.Drawing.Size(37, 13);
            this.lblParty.TabIndex = 0;
            this.lblParty.Text = "Party :";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(13, 41);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(29, 13);
            this.label3.TabIndex = 190039;
            this.label3.Text = "Firm ";
            // 
            // cmbFirmName
            // 
            this.cmbFirmName.FormattingEnabled = true;
            this.cmbFirmName.Location = new System.Drawing.Point(102, 38);
            this.cmbFirmName.Name = "cmbFirmName";
            this.cmbFirmName.Size = new System.Drawing.Size(274, 21);
            this.cmbFirmName.TabIndex = 0;
            this.cmbFirmName.KeyDown += new System.Windows.Forms.KeyEventHandler(this.cmbFirmName_KeyDown);
            // 
            // BillSelection
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(920, 532);
            this.Controls.Add(this.pnlMain);
            this.Name = "BillSelection";
            this.Text = "Sales Bill Selection";
            this.Load += new System.EventHandler(this.BillSelection_Load);
            this.pnlMain.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgBill)).EndInit();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pnlMain;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.DataGridView dgBill;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.RadioButton rbSalesBillJobWork;
        private System.Windows.Forms.RadioButton rbSalesBillMaterial;
        private System.Windows.Forms.RadioButton rbSalesBillRawMaterial;
        private System.Windows.Forms.ComboBox cmbParty;
        private System.Windows.Forms.Label lblParty;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private System.Windows.Forms.DataGridViewTextBoxColumn GPKVoucherNo;
        private System.Windows.Forms.DataGridViewTextBoxColumn GBillNo;
        private System.Windows.Forms.DataGridViewTextBoxColumn GBillDate;
        private System.Windows.Forms.DataGridViewTextBoxColumn GAmount;
        private System.Windows.Forms.DataGridViewTextBoxColumn GParty;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cmbFirmName;
    }
}