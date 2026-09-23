Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59A1363C53
	for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 01:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128282; cv=none; b=Sm7MY2WihCy3Hw1uC79ycd6UP/MKNYR1S+Vi6115/hkHOY7JoRjb6gnuLmcnL4TDibd78f6i8hGPM4tjMM5wxEdHOBFfZkjZdRAtRLP/FJSEdExLRhdpoSeCkIg7gJq6kBKP0u19LdHlrT3X2GodtwvkxwgvOU7bgT1GZCj5A8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128282; c=relaxed/simple;
	bh=y8V2hkGzlhdb/0KFjTahh6x/FG8XQrgc9cx9Thrw2Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V8/d7lXx1b8iZd7WLdo9iVFQtvcLWw5P6gQZVR0mnHo//3Scg3l3ipba619O2pdmvaMbXcYSOHBit1dp1dgrFF735BHYJ2n6FdmC1dhVY2srT2dGr3CbD/YCUpYyVtPAjJ1CxKCVMrpJUFw7sFxhc1m+Ll8RLJyt3xhc+7oRZ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3khGeY6; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3khGeY6"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc50d1b048eso354041a12.1
        for <spacemit@lists.linux.dev>; Tue, 22 Sep 2026 18:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128280; x=1790733080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjSZP90MeKeabAnBLqvA1Hzeszd2ueVzqTRJsmZUKHU=;
        b=N3khGeY6kJawtU5QJE0I8S59BK5bRQ2/wmZVk35i8+Xeqtd0qsFQzeuqv9ahc6N+sg
         jlm56Y/K2lsuGWH9CmwGoptXUKwFFS/WFp9ssUAFh3neVbKXQmxB6f5gGxW997GCc08h
         Vz6O/TDpPeRuJgMPBa4vWObj1Xq9FjIkX4CcDrfA9MqimWMMJFa35AbOgvqEbKhtJySL
         2pBv/jGQMamsG7VC7Q0cmj+WF1icEOR45yVVOhzc+5YYNTtsRWbIlU0wtNXK+SD4y2BT
         62SzHBQJs1YdMG2V/GiYXCg72MM+t6vp/hjt1zBaULUoFLPknlJlUZ3aKQl7VXzOElzE
         iHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128280; x=1790733080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HjSZP90MeKeabAnBLqvA1Hzeszd2ueVzqTRJsmZUKHU=;
        b=wlILkNYfNxzeJb9E5asQ+j2CuVo7OnTTPejhkYqlJT1RZ4J3mhWnRb3VTdqgSMGzyu
         cAS7VtXOZ/ChjbsBhHyTHXJsLIZcqteJg/AqeGmDqJPwTbBedjCrPZCiW8oY92/sSn9K
         TtGaKpx1mBcpEnZx0Yu8kBjdJgDD0O/AtYen7S/VGVPj9Nt1Q+tyiEAGV/hD7BTusYoq
         wFOE9COLBpVB38BRyI67GYW4siA84K5LIEIP3ifUuQchAabeh0jOZgg+ZmvqSYLhuNM+
         CckBdh0iCmLxhzgxAzIvlaEGRkNDnXZoJT4pEKMtmTstbqt63Xe/vVCj16uduwy9aAF3
         Yfrw==
X-Forwarded-Encrypted: i=1; AKwUvBxDuxoDQAbwZZo/unJcAGXYCD03glwXoQ4vpYIJ6M7+//TZtCHxP/IYjThlHb0tc37T53Z6aZ4tVw==@lists.linux.dev
X-Gm-Message-State: AFuF++moVaGhF/1khELcyWq18H39Ziqk5wQTN/9DlU3J7DLxaNW2IVFe
	SvvGZLeQMaf7+GOFgQcPgjiiLv886bnBvXtNzFDWDwR/NjK0oZICrViY
X-Gm-Gg: AYBFou0+l1daxihWbdF+M23HxmM2pDjGDwr852m19W2M6ywDxvMRLlnJ/4Cz0zGOH+1
	nInKP0YZ76injEN1LxGtx00IqobTomg3EcFPswPbourcHlj79DHLW3Mq7kRdemL27D9Q78+cGR7
	vl+lU4RDPE/JNWwoO9ZtwAB/xvdzNzBOrZU/QHcmZKhffpnrdL3NKGUFrP8vEenMgalJmTvLCdc
	PKHYy5zT2PEACO/PeF2tNIgHuVB/oAqn7KO9lKe+Ljx9I7PDTQzcdyw5ETw8Ozz+9YL2bFIHVFE
	8aQAaxaLMcmHGZecK6NMnn8IqHtbkxJvjCWSKmW0NxJ5ZPSQTfsiJcoY6dz8xZDhINQbFGcFbj0
	2UyUpvPZ/bBHNW2TYOP9jmV3mC52/XzeiIyU1HTSNhYqEUc5YiKnzpYpJ86UQm9ebFgt7Ryv3gL
	CM2t7omEPwO15CIQmuACO4wvtpenBilg0ORLNbFXKx3JwourlEyNJLiLoheQ==
X-Received: by 2002:a17:90b:3f0e:b0:39e:6c6a:6572 with SMTP id 98e67ed59e1d1-3a07e6563dcmr1112630a91.53.1790128279914;
        Tue, 22 Sep 2026 18:51:19 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a085b5694dsm266746a91.6.2026.09.22.18.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:51:19 -0700 (PDT)
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
	Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vidya Sagar <vidyas@nvidia.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Ping-Ke Shih <pkshih@realtek.com>,
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
Subject: [PATCH v6 3/6] PCI: spacemit-k1: Add device id update helper
Date: Wed, 23 Sep 2026 09:50:12 +0800
Message-ID: <20260923015016.64069-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923015016.64069-1-inochiama@gmail.com>
References: <20260923015016.64069-1-inochiama@gmail.com>
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

