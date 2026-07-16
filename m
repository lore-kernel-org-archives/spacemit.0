Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10873016E7
	for <spacemit@lists.linux.dev>; Thu, 16 Jul 2026 03:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784172141; cv=none; b=lWP0/rz4bmh2xiR2qj49dZrhWHtjQrzmoZjdMRphUfqxyYX4EXrzKA0qe7O0mgh91YLwLVFshVWF04hwD35hObR5anETBvZWRVT94q14GiHRD352fF1JrjK7ZtozPIGFFNqOlHfvb0W1ca+d9Ep2CfldZu3DYGLpBAW608Oaix4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784172141; c=relaxed/simple;
	bh=elJNDpCx9A/ond//LPRjsJyfG8dwc8CRwQsb3uFhM1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OQjN94fg+NNa3Upm4QPRI847R/bmEdrh5dDwVRkEYR3Ef4PvmCklGHQ7a8+UVkucLZyXnaG/OijNJnzo/YEoD1JMx1x0VcTmoSbJsEOP/gJt6syih+YUwha8eGOh7PC9VZlSW7Ohcv+O3mqZ7cYpgfoOrmn8FBrzSgVUMdYIQW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=B+N65CwS; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="B+N65CwS"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81ec29f1d07so27695927b3.1
        for <spacemit@lists.linux.dev>; Wed, 15 Jul 2026 20:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784172139; x=1784776939; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmLTscAEY1O1j8tiZ/+N1t1kAFbbT11AKs1SQQgixyU=;
        b=B+N65CwSfsVgNemeZyOZdjGOXJqU1VHeMY8N51vpO6JQH4kmEqfO4fKIGPcSDLQRus
         54B6fW41f+jma5TX2lGMER8m/x82zbtJlZt4Kz/LQJMkHWBgqm7xKs8btStLpLegyWGs
         pCrYnHhbO1m8wTR5QdDZelcfIpA5ICnA2hfC8gXjJIBxMBWWpIaLojoPd1760BRvVydY
         teHhRZLurA6W6a05pBsmuGQCB4llAt89CYJ/Bvj/DF5RUulEICPrkIkjFmPGCR7T7shi
         BcTSlWYoc051EN2tGF+KoSkeknnUWchE+mwrR2a4J322ot8UeY5t9xf/DIX4D+7+0Y5V
         RsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784172139; x=1784776939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmLTscAEY1O1j8tiZ/+N1t1kAFbbT11AKs1SQQgixyU=;
        b=n20ZZijCgyhqlwkmGk5iqOWRc0ymK5yBuXjJUcTSZ0LX4b/KVIbg9HyB1nFmShaILa
         ZyL413FDzXOZkPeqmpNEF8InSMLiSJuvruKbwHOyx5cPTyUB3qv34OohRVJUwwtdiYUg
         JFgFv0S9zDK0X0v9f3krCCiHEnNDkWMGFFHfHmOLzECrHTZGn15U02mAPpOSHaonlrNx
         PnoEjN9DKN8WjagHAq2QvxzTe84nNEuK1bwK/onpk6I5xEJMShyXqZpiUqhu44eNxxQY
         2EjttQaVW+FUeWTHNptlKEogjKILVOK+BNDH18p18rEqXuZonW1Q/QcypoQDxYIbCUBi
         KYSA==
X-Forwarded-Encrypted: i=1; AHgh+Rpl9Wi7zkEHZKR4SDuIh8vQML66t1TM8RS4F/UeKbkkA+HFA9kStq5fhzsUovzrYi1R7qwmnLuqAw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo1iTXRsr2VMpSNa0TTCGfcoZNEcTcnuQbATYF/lo6pMNgrS4L
	8M0ao1YzCN6pxYe5I/NJBPVFv0C2zlB5dzO+ZsZmG1nQQP0GjK8S6mJeD8pfZb6JZnE=
X-Gm-Gg: AfdE7ckikot8riqHyULM93yS77brQ8WRbr/HFd2Riev+k7LK1Shv0Urw6sTZeHzAHcR
	Qc6/Do/LQIO1HbEGVsS5frW1h+UspvN0VC5DVHnhpNCBIY8UclQNzHg9dD3R4cvfEvnekQThscA
	qp1SkpU+46Q0Az6jWhPSQmJ3gk9slJo+/B/uhe82E9py/h+Pc5ZJTcxOjI9448zSIg3m2FBT/JR
	zE5GWN8Jr735uqShyxE4mr7kCrPWrPBxrLRTKJ5odNenKxRnq69mQ7NuPV/f1QnJCAzC/JLEw7X
	cXpislBcFi6910FDnIOjbKNvBuBdAgdac03oozRTEoQWqZzQ68tJUjKzaQ5pHczjF2sGOTGkD6G
	g7L2GJbxnx2ZWzS6vwEXfIBsDG2uJ9JiJW3pAsvnoRwP+8vun7RxCLl0qqgGokXzd8uY1SrZW59
	BsxHKMMQ4wdi6CrBSYI41MKoyyfZ40FPRQ5fqF+KwZRTzao7zv+ckqZ8HWAg==
X-Received: by 2002:a05:690c:c86:b0:7f5:87d3:c38c with SMTP id 00721157ae682-81ebb136b12mr83075437b3.21.1784172138727;
        Wed, 15 Jul 2026 20:22:18 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:56e1:f9cd:8869:2218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6befb688sm185039127b3.14.2026.07.15.20.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 20:22:18 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 15 Jul 2026 22:21:54 -0500
Subject: [PATCH 1/2] PCI: Move Spacemit vendor and device ID to
 linux/pci_Ids.h
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-rtw89-spacemit-k3-v1-1-e577bc63706b@oss.tenstorrent.com>
References: <20260715-rtw89-spacemit-k3-v1-0-e577bc63706b@oss.tenstorrent.com>
In-Reply-To: <20260715-rtw89-spacemit-k3-v1-0-e577bc63706b@oss.tenstorrent.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>, 
 Ping-Ke Shih <pkshih@realtek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-wireless@vger.kernel.org, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1

Move the vendor and device IDs for Spacemit PCIe Root Complexes to
include/linux/pci_ids.h so that they can be referenced elsewhere.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 4 ----
 include/linux/pci_ids.h                       | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 680acc93f5395..7b0bc1802954a 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -21,10 +21,6 @@
 
 #include "pcie-designware.h"
 
-#define PCI_VENDOR_ID_SPACEMIT		0x201f
-#define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
-#define PCI_DEVICE_ID_SPACEMIT_K3	0x0002
-
 /* Offsets and field definitions for link management registers */
 #define K1_PHY_AHB_IRQ_EN			0x0000
 #define PCIE_INTERRUPT_EN		BIT(0)
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 1c9d40e09107d..d6f26cacc8e35 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -2640,6 +2640,10 @@
 #define PCI_VENDOR_ID_SUNIX		0x1fd4
 #define PCI_DEVICE_ID_SUNIX_1999	0x1999
 
+#define PCI_VENDOR_ID_SPACEMIT		0x201f
+#define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
+#define PCI_DEVICE_ID_SPACEMIT_K3	0x0002
+
 #define PCI_VENDOR_ID_HINT             0x3388
 #define PCI_DEVICE_ID_HINT_VXPROII_IDE 0x8013
 

-- 
2.43.0

