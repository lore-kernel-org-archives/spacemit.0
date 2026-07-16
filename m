Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5A43CB54E
	for <spacemit@lists.linux.dev>; Thu, 16 Jul 2026 23:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784243137; cv=none; b=VE/skWWEhNseUZo9Xl0WM8+A54TKZfnglIf9YVDAnGXxYDOj5KFMS1fzZBQ0Sf83KDwkK/3t+A9QM3JVZOLqPPAjrcVgGZAcOlYfJcEXlexqi8EF0+xGFGaJoZE8+ZOToLzAWssyAY8aokNHAQUsHgnC/rXPJCdHioQ+HpCLhbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784243137; c=relaxed/simple;
	bh=4QUJGefeX7v0wFAUJrkXQvo4SJ0LD6S+CCRwZONXwZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cdGZhqbQpwP+nKJsFbf0c5MnyT2+2Tlfu+rxCV+HI/3FEHIUvk0ujgxy203aOwKWnaN01l7Nl62WWUro2Ho7JZNKQl0u6GEsSVlpdr7mpegay4GnZnabjRpJGHmnyXaBlnm/HC+0MzMA/Ws8mNy2Eqh0WfHFgZzZTgcHeA6SwG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=Y5i1ZTwq; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Y5i1ZTwq"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81e9d8f3289so49390117b3.1
        for <spacemit@lists.linux.dev>; Thu, 16 Jul 2026 16:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784243133; x=1784847933; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhKY29My7f0UHkdvHti6xaUzqbFLMYcjf/PtSfS7aGk=;
        b=Y5i1ZTwqSwoOXb8QUfmWZiPDeIr5bfwcOWfSzuN1McCLfvgjkBjlyeXV8BZLG7gjIu
         UWH/RE/1UTcYuS/7c378ZqHRhFWjNRC1LxqUF7YS50Pj2A7NvaonYWWnRdssQZliSs0+
         L7J/FI3Eu9nWqrQhY6ZmiRaJfGvSWgd2JLvO5YqTsrjhbq7NXQ64T2EUfvzyJ26wvVft
         CUqOXYt/eY99qwZOhyGPbhgvSVfgG/DXZ0vcqG3up6AnrfN4rHsIkyVc24BsuMOy6DVs
         zwAHAlm7ZSvj4MOYa0c9Luwyn0DsYDPp3J/3KgjGUPZz+QBCTSx/roII6RT+kM6jYDb8
         LJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784243133; x=1784847933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhKY29My7f0UHkdvHti6xaUzqbFLMYcjf/PtSfS7aGk=;
        b=AaUXAkLz1JNuVpDVfY9RIDTVAPrxMg/cgmMi8xAvSRxuximqDjegUSW/xwTjU+uVCu
         U9ICru+I+zeW6UwM7SkbDfZf5pqr4BkbCtkwZSp2I0wjQ0Op4tUFsycqUT4npo1p7TSf
         Z57FYnj05+2i7eZWN5urbEsXlvdJGjFqMSqmJsVs5if3MePaD4tFhrdn1IhxZzNq8U1q
         D9ladvhlngboJA7z9ybUiSOCJ1iOuRarERfZmrUx6rn/+Vtk5pWft7ltbfjSp+DuqUYZ
         0haQYZM5uSZe9/luXone2ea0Jn69QFn58rCUxHiadBf0bJgIMCy54ZZ6aNRxgximPZ73
         0Feg==
X-Forwarded-Encrypted: i=1; AHgh+RpyBjHA4jpACJbFbNrfpA5HCKZntCJOvwyovcR0YcaBtP83+IX0ujxf1PYTCVsFpvdmI8cJPb5FEg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9kXnAL5387e7mJvwhXdWoDy5LRui90ZPqCTdy5DcA+XIzk1VT
	R4s+uOgvLgJIbMNUoftA54tcLv/4OY7VGSio87M4Sr6INsnUDJcPptz6u18dOgONLjc=
X-Gm-Gg: AfdE7ckKKeQBX3JxMwgpzNfqPNHlyuxpUOg58+9pPfC4sVM+HeVnA1PaWCmI5nlO2Dp
	uxuvmW4ipqMHx/WI9FZ1aGarA6ICVlJDiqkoWAFD4rsRd2c/s7myR2sVkIHAEBUiatJKmz1JjGk
	TuiBLHUIhlvenQ3esXBxxocjpXP7jKYz7oyseDykP8CNFn0psZjaPaP1lJNLs/LLpGzoOowpvX7
	Qk1aLDlq8USqO0nQanzZPNORLXVulGjsRD1DTRItqIL0Tgg1oi2dXUNjjnvpuxFPMuWMPehdIFl
	z4eO/oXn9tMBGstNQXZ4+SJd4A1CfByQbZU0vZZ8/lTx5eQjHjPTRF5Ua7dt3nAyFLHtq/9YyvF
	vbYNPACm57ZIffOxu2nodxLucJpMurS5WSfcmdWzptfmZ/b3dDBWc++bQS97fukQFMRPTFrgUjX
	cANF4rTU+Skl/H/s2H/fmFkZZU4yiBCTPZ9EMWBOhaA/41TrukgJjfJ3a9T8hNtGSVFd7B
X-Received: by 2002:a05:690c:998e:b0:81e:c998:9c9a with SMTP id 00721157ae682-81ecf7eef26mr66141867b3.17.1784243133409;
        Thu, 16 Jul 2026 16:05:33 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:40df:d071:3a06:1c14])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be90499sm207006837b3.5.2026.07.16.16.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 16:05:33 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 16 Jul 2026 18:05:10 -0500
Subject: [PATCH v2 1/2] PCI: Move Spacemit vendor and device IDs to
 linux/pci_ids.h
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-rtw89-spacemit-k3-v2-1-392b577ebf75@oss.tenstorrent.com>
References: <20260716-rtw89-spacemit-k3-v2-0-392b577ebf75@oss.tenstorrent.com>
In-Reply-To: <20260716-rtw89-spacemit-k3-v2-0-392b577ebf75@oss.tenstorrent.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>, 
 Ping-Ke Shih <pkshih@realtek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-wireless@vger.kernel.org, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1

Move the vendor and device ID for the existing Spacemit K1 PCIe Root
Complex to include/linux/pci_ids.h. Also add K3's Root Complex device ID
to this header. This is done so that these values can be referenced in
the rtw89 driver to enable 36-bit DMA ability in it for WiFi to function
on the K3 Pico ITX board.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 3 ---
 include/linux/pci_ids.h                       | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index be20a520255b6..f89c6d46c7684 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -21,9 +21,6 @@
 
 #include "pcie-designware.h"
 
-#define PCI_VENDOR_ID_SPACEMIT		0x201f
-#define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
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

