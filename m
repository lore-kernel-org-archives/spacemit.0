Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E4E31A570
	for <spacemit@lists.linux.dev>; Thu, 16 Jul 2026 03:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784172142; cv=none; b=hSvl7QsFITzsCkywfrBSvFPUQ5XMfj/PEl1jRBW6Emoce5HCuGDfBJGrKyHDf2J9PoKOEN8yPx9Zq3/din6qllowpKmNVo8niqHx9zIvyqC4lKFOhDXjFuWp2Gf1FZNfk1hNOz34ffKsKoCTBK8ZVsD+CgYismyevCjiZEKc100=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784172142; c=relaxed/simple;
	bh=5D1qVSBbWfn7Tpv6gHBIf1HEIkdpFl8pWYg+EmhZk/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OgCUWASrmBANZIST/cn9tyqehZ/+rMxpmFBtHCCEtqiI4Q9i/XNoFbUYmskD/hp75iPn6qQrNbscVNuozj4Jt/BM91n6FRm3kiE8SIoDky26zHyMkXE0t9QEmzFE3jj1dXl6aJCPT0xF+1hReQj6EueEOXk3QELsQ0e5zX6M0Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=CCOEi5bu; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="CCOEi5bu"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-81e9f7491ffso73719377b3.0
        for <spacemit@lists.linux.dev>; Wed, 15 Jul 2026 20:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784172140; x=1784776940; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48efBL+/zgjdRX5eeYvPyEwynq80yeCCfHgWW6gkRZI=;
        b=CCOEi5buCU0W/Jjbqjc3FavoMsjr50tssJIR8hvZTHZAecGgVTNOOJC6kfWilzS0Nv
         UA/a+Vl3TJIpPB/zhw+TS3lPvYu/19nkI0XGDx15YqdlTdahS4GW8z2ftPhjiPFyEcNZ
         VJ91lrAssHuVmHc+IL46sfOBl/+l/7NbccUVXYcDAWAfSoLIjy7XSKMWMsqDrVa8niKw
         pQ3YOhrEAgBmZ2hvVBwvmBAaWbIaT6MeVwy7I8LTo3mQ9FSvMlGzQzQEdmUZ/0cIqJZD
         00gylYHtRG8Rh3nUBzAurzu5n+irJrUQ01lfecmdLv3GY2jqZRixPwo1D5WkltOYyF+5
         Z5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784172140; x=1784776940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48efBL+/zgjdRX5eeYvPyEwynq80yeCCfHgWW6gkRZI=;
        b=f8ossWHmKKzUXipyIlcfJZoVINapNsoR7jfsTLf5Q9xnjX6VkgcnPgI8RwH7SUi9Ru
         RkrlPUzV9eBwGmK7i369wjh8vFVEBCnDhSNfHNBiFngxZO7jueORh5ZNn6aSXSqGOU1e
         jgDar1HL5QRPsANUIIw3JvwJkoKXIa25xpzVgUnub8D46H/LyvMj4qbhEvF0QdUzfmHq
         wgQJSp8C39PgD3JqC7gv8ndcMJdlg7rsXEbbuJYbJxbwI9Gn7oomjDAD+JTrPvcx0Exs
         QDSl+lqAuBkD2tyJLyBFOa7vUheRqIKB60BXJbf0Q40qH7Y7Bw6cGvI4B+yEplC/xtFD
         F3Gw==
X-Forwarded-Encrypted: i=1; AHgh+RohtLOOl/cPoKf2sohf8RSRrGK4pAfNPrUMU7bX5bYmYH7d4Va2WmOfLeZobH8Dsp7uxNt5238NZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXmLrTNPCI7mCvrj2L/LbH/CFrMZ4m2Yc+00MfDtG3Jcl5CL8e
	OtbyBOfIn8s3/vCLmYaVcYcM2A9hMFMbw5BJpU4nD6jNGnsE9UjcJgjlIeSFLG8hFo8=
X-Gm-Gg: AfdE7ck6GJK4W1STT8uRiyP0L9LwSTJcNx518uDfVBQh66ZELiwXq/mrDruD/WW73um
	prdbdnMjx7ZWLHKLTtwqxf6jCD0zyhMQ2B/qsL/UXKPcfKEzmBZMJdFcmrjK/pJHfSHOgb/AuSX
	VjsBaUd0B+er+kkkFJTDtl/rpZqN++ZZIwLL97f2E81YWBVDlzif2uM490gAFnLUoPTXDxTHdha
	oyynqHrn+N9QyvR6n4ghbP0hR2Lja8B4eygldJ0BYe+Uh/jBcGSPKJAlAS/CuV0BBYQIpMHuL0x
	8MoAueiCHqG5Qq5SD5obJ1pGMKQo7dwhzhSzYkF+iBDYOyt1lTH3FFVSqxmMQqvQfWjiEgaqYdh
	qPy/ptv8ylXH9S5Vd/XyQENiBQHV7LxLvOf6w8BBepqwtZmxTNSqFHRLvNQ5+e1E9/Jd8uC11yQ
	MOPWR2EvmmSezOsmBRnpmmt25TVL+D3CXcBEMWOTHPF2u4aZ51q1ncf6VAmA==
X-Received: by 2002:a05:690c:9313:b0:81e:d300:f427 with SMTP id 00721157ae682-81ed300f4f5mr29106957b3.5.1784172139650;
        Wed, 15 Jul 2026 20:22:19 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:56e1:f9cd:8869:2218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6befb688sm185039127b3.14.2026.07.15.20.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 20:22:19 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 15 Jul 2026 22:21:55 -0500
Subject: [PATCH 2/2] wifi: rtw89: pci: enable 36-bit DMA on spacemit K3
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-rtw89-spacemit-k3-v1-2-e577bc63706b@oss.tenstorrent.com>
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

The Spacemit K3 Pico ITX Board has a RTL8852BE pcie card behind a PCIe
root port, but the SoC doesn't have any 32 DMA addreseses which the
rtw89 seems to use by default. Enable 36 bit DMA ability that the driver
has when this particular root port is detected so that the driver can
probe on this SoC.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 drivers/net/wireless/realtek/rtw89/pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw89/pci.c b/drivers/net/wireless/realtek/rtw89/pci.c
index 102bae4881805..c5b82fc46d063 100644
--- a/drivers/net/wireless/realtek/rtw89/pci.c
+++ b/drivers/net/wireless/realtek/rtw89/pci.c
@@ -3326,6 +3326,10 @@ static bool rtw89_pci_is_dac_compatible_bridge(struct rtw89_dev *rtwdev)
 		if (bridge->device == 0x2806)
 			return true;
 		break;
+	case PCI_VENDOR_ID_SPACEMIT:
+		if (bridge->device == PCI_DEVICE_ID_SPACEMIT_K3)
+			return true;
+		break;
 	}
 
 	return false;

-- 
2.43.0

