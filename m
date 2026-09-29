Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2CF47D95D
	for <spacemit@lists.linux.dev>; Tue, 29 Sep 2026 08:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671098; cv=none; b=LfIJAQFDT9TR0Hk9fws5RjhY3rEBGJEMoP2tnq2ojjNUEyRu5g3Dks7gQjiB8GYmVf3H0fII6HsM9c+Sbav790VIlybGiOjJoLBuk+2OMilkEKdpXhu6CqS+uS3zYwlOPAsAHcT5wygK1fwDsHDJ8L9EqT4LhIEvOKrpHZqMim8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671098; c=relaxed/simple;
	bh=y8V2hkGzlhdb/0KFjTahh6x/FG8XQrgc9cx9Thrw2Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViAak694I/52bKuPMVpM/hF/urlhh2zAlWztQW1O7p2cqttad3GKMz0HPelz137NhIc04W37TTb6rmrBzaeD918T9LyWsX8SFkrdLMitUEFXOCnslm9NR/VjRsKi7J1Jn8dl4XYvjeG7pcsmbKi8pNHpVzYVMG58meIePJkCusM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyYbyumM; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyYbyumM"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49b6bb21eso405171a91.3
        for <spacemit@lists.linux.dev>; Tue, 29 Sep 2026 01:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671096; x=1791275896; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjSZP90MeKeabAnBLqvA1Hzeszd2ueVzqTRJsmZUKHU=;
        b=DyYbyumMTukxzZ6M5Tnu8I9GGx+Xo+oGvWNUfJUPFrlA2wQkYcJJ52Y6uJRzPFtq30
         +8YsTec2ovIzR2J/ZPZJ+y3yjeATTtXonZc/AR72k6cLl+CJpFz3vYIgwBxua+YradMO
         FBArY5WGOd+nfRwVz7xwrZbePSLu6N5MRRBs/jNwppClXtcwDL0RxsTi1h2GEctIXSqf
         FuiEluc+SqrigdWfCbdnUC3AhU5WBHkSdGxGj7U9+N9k8J6Wx8eTI8376xe4xNUG4UeB
         bpqV+6YfEKZhYst+yx7PHERW7zTx4RteuiGfNkX+0/IvUj7JAGDxUXb6Bh++HF9ciJc4
         lMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671096; x=1791275896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HjSZP90MeKeabAnBLqvA1Hzeszd2ueVzqTRJsmZUKHU=;
        b=M3/sQ62VmnevWkGVWXRIH0c6J0B6KSm2wEU7viGOYkU1/ysaeKsyQUI0aJ5dO4KoXx
         4TMrVCU/kPRJZjzB3lyexOyOSvTSuCMayBNR9WLiqPyQj8gO4Zq8PcP5gW5ypzWVsVdE
         tneQKrLhfHic1S9HFc+FzUKCVvhLFKbYbNaqDXlu3qDGbOoQOJpm2IjDs2IdYAodySvs
         jU75b1bxoZlJ1ai9PQt4t3r+b8rD/zemDknLyf56VHMXccZ7KR8IuG7cjM4EBNOOa8oM
         k6BTmqqMAeBmq7DzEfebYPnOr4R+dFxJj4jIykxzOVNhMiTGgTKZDuLHp8+lHW2wngkX
         0wCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXaJ4qAunzaoifnnlNrW7LNNzqUiEfmq6mH13662M84/iapAhEku2h0SbYAOgzHOO6nICkIvcyAA==@lists.linux.dev
X-Gm-Message-State: AFq9FYI0M1aL0YEXEXwRJCSp18qxcTUa8yUGT335DLtVJOguXANHxgic
	tmBLr17z13bWu9VzYDy84L8le5wZsfbduLCR/e6Fjp4T5Nzgsw3H2/1V
X-Gm-Gg: AYBFou2lSWXRhExhlgMVMRbuVkmmZiSuJMu8xSw1iECZQzp2UkNeVxC2YAH0Yg0xE9w
	oiOI3rPZb76N0uAbD82zVpdjQKfFriLylsMcnDEjsv1uoeyp7hkP2VMfQ5UORLbO+Qf+8FFXZWa
	2xCBBG5bjh2tEaizZ62mEKx0vUMiPVn4Naj5t0z9wloxLX0CXnQlXkURP5p7oK5psbjH33rkf6A
	Wk4iuQPD4JtQlu9M802Px+hTIGupqM3Da/mr8pdqhVkMtHk+md6bNgKvVZWBBXIBa4yc7p5vizL
	xjPY0lLvsD7HO4lNmN3s2zn7F4B6gYuloWOTlDlScqV+X+KCoX14/C98hvIZuMVAIvwAWuzrm3I
	i7an+swVrYkUstzBkbmW2xAJkgTRsvXWjk2ufHVYnjKVwEQlS9sRZO89av/gChif9TUNcptXEMa
	kRssCkcrGXRBjWtcUtJjBgH6BmDgJc9SptLtSzJtrHseyV5pQA3Sx3ox5+HMqknEbJSc2d
X-Received: by 2002:a17:90b:17c6:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3a098761df2mr11251455a91.26.1790671095882;
        Tue, 29 Sep 2026 01:38:15 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2c9d06766sm5127845ad.54.2026.09.29.01.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:38:15 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <cassel@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Randolph Lin <randolph@andestech.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v7 3/6] PCI: spacemit-k1: Add device id update helper
Date: Tue, 29 Sep 2026 16:37:49 +0800
Message-ID: <20260929083755.458238-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929083755.458238-1-inochiama@gmail.com>
References: <20260929083755.458238-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both K1 and K3 need to set vendor id and device id, add a helper function
to simplify this.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 8c4f0b09fe24..ec59ccb710ec 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -52,6 +52,7 @@ struct k1_pcie_device_data {
 	const struct dw_pcie_ops *ops;
 	int (*parse_port)(struct k1_pcie *k1);
 	unsigned int max_phy_count;
+	unsigned int device_id;
 };
 
 struct k1_pcie {
@@ -153,6 +154,16 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
+static void k1_pcie_set_device_id(struct k1_pcie *k1)
+{
+	struct dw_pcie *pci = &k1->pci;
+
+	dw_pcie_dbi_ro_wr_en(pci);
+	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
+	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, k1->data->device_id);
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 static int k1_pcie_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -168,10 +179,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 		return ret;
 
 	/* Set the PCI vendor and device ID */
-	dw_pcie_dbi_ro_wr_en(pci);
-	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
-	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
-	dw_pcie_dbi_ro_wr_dis(pci);
+	k1_pcie_set_device_id(k1);
 
 	/*
 	 * Start by asserting fundamental reset (drive PERST# low).  The
@@ -381,6 +389,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
 	.max_phy_count	= 1,
+	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.55.0

