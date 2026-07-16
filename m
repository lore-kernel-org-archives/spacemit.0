Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0D13C3F50
	for <spacemit@lists.linux.dev>; Thu, 16 Jul 2026 23:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784243136; cv=none; b=nIkQlKVElgkKKqnZWli6V6ieP11560Uw88K3BXRCm400xLPqoYCQ0FTzzQ3f4Q20nNLbS1bVwFo5LexWfFlEkjVg7pO2S0FOsz8XTfW1fk7eJugr+oER7qCyo4Xz+1b3niaV+YtJGm+hIICPkZQrQ8fN1N+C1ncbtg3vQr7C1HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784243136; c=relaxed/simple;
	bh=XjCIt0KCuhMV6ueAwPxlgNW+xh//owQIPs0SDmY2sfk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r4C9ZfWIuurZP2nXFt4cwu9qN6eStcO/coMuF2G0Mt2heQGDeEMOSs/DbiOUVc6GSQhMzhcbvQqn6JyLIMYzKRVYxvmZQy/BSDz2ZqO2piWmE5AUTCppdZx19IdMCbB0vtgBG+cbXblZCQPRv6a2V7Gb7eKLGd7fy4BUdhRhn2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=GQganIE2; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="GQganIE2"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-80a123ef90aso21293737b3.0
        for <spacemit@lists.linux.dev>; Thu, 16 Jul 2026 16:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784243132; x=1784847932; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oK6R8pSf4q5klrNu6IUKUSP5IXczJYV+oguJ7eE6+Dk=;
        b=GQganIE20Twb4YM9s1TN94waamKBWzzhOJdvM8FRroTZXW7sii/4AnwRotwm/anNVw
         jTUg4bWNpOaoOM8Vch0Qlk/H7j28gDMGJLr+wRHTG4QZwaZi03IK9SxebdZamlDamutV
         GpiSvfDY3HwqSvHl0SMio7+W7TonZ50SPDOmLQV5cCNuanwxHmTHAAg0ukmvUbrexD6O
         Agd50F2gb7T4N1Dvrqww9DCkvs/bGHvzLBLhQsaRX9z0fxEBFmPmFZ/9CWISw/Z7apzJ
         zkMre9T8PF9XB0C68I4plEH9l4G/F9PhE9+rjoTcarGoi0F/xAXzIuAr8B84e3eVmJY3
         yh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784243132; x=1784847932;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oK6R8pSf4q5klrNu6IUKUSP5IXczJYV+oguJ7eE6+Dk=;
        b=i+vS5TbNU6I2MZzXgNS2DugQU6jk7ZBZP9unMyLJI1LAvnC5A9RkQtiV63XpBLDrJd
         lMwS7ewliYEmdh/Kv2hnUPbtzLbb/KhVecMGB5tjx+sWMrPW/Ps2Ys8tHUsC+C1WcGdE
         84eeRheZOmgtBKykWv26KooeFn47fWUvyEZPLicQfroWD63jFYRLO/eNFWLapcDdsnlP
         qMLlc2faMrjQNaDGU9rP5X8sp8OLbHgwq7JZge8sYKlW2etSUSQyvAzfN+aM0/iSJqrS
         RNOAZhv1RbIcc8NJWkjw2YMxjN5hcIXFKkrhT0MrKLU4saEcktdYqroEfIg7K8314HXN
         aJjg==
X-Forwarded-Encrypted: i=1; AHgh+RoCMCSx3kCHd1YQfPoQtCeJSbBmIkMlCTVjTUhngJ8GV1OegGyGqCovN+8ogvQSlaBumtuXrXSu2w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yya5uNXoG/gZ8XTAdAd22KU4CbqpSZd+4f34krKVNQsXBn5Sb/Z
	S0MQO+VC18k8bu0rQ/f9aJJChtZCjerT5Rfj1w2oZ70qJS3XETTuWjXYsUTXwxtAwq4=
X-Gm-Gg: AfdE7cnPA9A3DzuYv2iQ8QbCI9zUcGMkfG8n0xWrpbEhV5Qobi8dhGGukPC/sKbkLIo
	TBlGPb7KJB88dUnBdBQ2KyxQunO50P/9lskNPB1Gg1TwmOmalor1PtGSSehmNOIDcFiXM+PoU/V
	YVReavJldDd8iyl3YbqWQG9SnYKiI/6Go93ZW6rvgnYbVimUL1DNVMCELVB5ZCgKcSxIarps3iV
	clpX+vBuDT9htMIa+MmklloLFx4JxZeIci8gPUz4KQKNauBR83IKibdxNeK+qDtNgLJJbKPEjE1
	cK+i5yVymHBTINLDn1kMb91gu3smIjtXRJEIeUTpIQPZE+qWaCZVyfGgrPAqPj0miI5/ARr2Yuw
	EEKgRLpUT7VesKQ9xmel9tWqex6Thxi4UNvKpEfwKhEZJHaNbZ8ciX06qYqBm0dCH8EKw4BvRze
	wba0qD+98ohKVdQ87pArAQgR/ONM2aqaOjVh///ip7/44ko2vuggqY9JKS9g==
X-Received: by 2002:a05:690c:289:b0:7dc:1c56:2901 with SMTP id 00721157ae682-81ee27da32dmr27774457b3.1.1784243132428;
        Thu, 16 Jul 2026 16:05:32 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:40df:d071:3a06:1c14])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be90499sm207006837b3.5.2026.07.16.16.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 16:05:32 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH v2 0/2] Enable WiFi on Spacemit K3 Pico ITX
Date: Thu, 16 Jul 2026 18:05:09 -0500
Message-Id: <20260716-rtw89-spacemit-k3-v2-0-392b577ebf75@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKVjWWoC/32OQQ6CMBBFr0K6dkhLAxVX3sOwoHWUamyxU1BDu
 LsFTdy5fJP/35+JEQaLxHbZxAKOlqx3CYpNxkzXujOCPSZmBS8qrkQJIT62NVDfGrzZCFcJrVS
 mVkpoaSRLvT7gyT5X56H5MA36giYuom8i4H1IY/EX6yxFH17rJ6NYrv9GRwEcsFRKm0oqXum9J
 8ojukUS0MXc+Btr5nl+Az91dJ7jAAAA
X-Change-ID: 20260715-rtw89-spacemit-k3-a37c9771b3c3
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

The Spacemit K3 Pico ITX has a RTL8852BE Wifi card attached via PCIe.
The probe for the rtw89 driver currently fails because driver tries to
allocate a kernel page with GFP_DMA32, and this board has memory only
above the 32 bit range. The rtw89 driver has the ability to use 36 bit
DMA addresses, but this is only enabled for certain PCIe bridge/rootport
that have been validated to work on. Enable this ability for the PCIe
root port. A similar patch seems to exist in the vendor kernel tree.

To test this, you'll need the 3 patch series adding the K3 PCIe RC
Driver[1], K3 PCIe Phy[2] and K3 PCIe DTS[3].

I've dropped the dependency on [1] from v1 and added the PCI IDs to
pci_ids.h here directly. Inochi's PCIe RC series will now use the PCI
IDs added by this series.

One question I had was about whether the IOMMU on the K3 could be used
to do DMA mappings and allow the wifi card to work with a 32 bit virtual
address. The K3's IOMMU isn't supported currently in the kernel DT. It
seems to not be enabled in the vendor kernel too. Even if the IOMMU was
enabled, I'm not sure if it would help with this exact problem. The fix
proposed in this patch works to solve this problem, so I've sent it to
the list.

[1] https://lore.kernel.org/spacemit/20260709040027.958400-1-inochiama@gmail.com/
[2] https://lore.kernel.org/spacemit/20260703021024.495433-1-inochiama@gmail.com/
[3] https://lore.kernel.org/spacemit/20260709040415.977784-1-inochiama@gmail.com/ 

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
Changes in v2:
- Updated Patch 1's commit with reason for where the PCI IDs will be used
- Dropped the hard dependency on Inochi's PCIe RC series and add the PCI ids in this patch directly 
- Added Acked by from Bjorn and Ping-Ke, Tested by from Aurelien
- Link to v1: https://patch.msgid.link/20260715-rtw89-spacemit-k3-v1-0-e577bc63706b@oss.tenstorrent.com

---
Anirudh Srinivasan (2):
      PCI: Move Spacemit vendor and device IDs to linux/pci_ids.h
      wifi: rtw89: pci: enable 36-bit DMA on spacemit K3

 drivers/net/wireless/realtek/rtw89/pci.c      | 4 ++++
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 3 ---
 include/linux/pci_ids.h                       | 4 ++++
 3 files changed, 8 insertions(+), 3 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260715-rtw89-spacemit-k3-a37c9771b3c3

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

