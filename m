Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9556C3D810D
	for <spacemit@lists.linux.dev>; Thu, 16 Jul 2026 23:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784243137; cv=none; b=jgKe2KE3ui0gWYWhBlfcw7jbvgvXgd6/9i8NTRfZZIpcLr81gdNBTJvzVmAVPG6CCcI09liqMN7QfA5eK5tXLCiqmZbcY8z+7Yx3Ztmdi5UMvz0DnRfr05dH8mSa/qosBzxk2rMT34+qSgvD4Keo9PMUuhQCTd0Dpm8fOpkXle8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784243137; c=relaxed/simple;
	bh=5kEJIrTmt6UgJJ9EIAIP1lfd2Jytm7zKjTI/lyAE8bQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KObrPr/ZTE5lkYvj1qybQeci/fscMRl8pWnKx0T3+r4R2IcdGW77+O6ybLhA/KA6Y3ey5Jvc45dKSJ1IHLraay/Wmgzi+a9jtRefd8wVbrYBArazZzDvu6eGHuzNIbS1ONRKVOsoGiPlmKq0Qr4j6zACuNmz9e/DxXi69k5pILU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=W4AoOgcD; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="W4AoOgcD"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-80e24970f1dso31036007b3.0
        for <spacemit@lists.linux.dev>; Thu, 16 Jul 2026 16:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784243134; x=1784847934; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bk3USZv12WGxErumeiIAVcQcqRoeJeqlNLEHc8GMv1c=;
        b=W4AoOgcDME5vch5P0m3lyO5MpApr654ac9bAMUrlr07G01/c3DREdekwuTwZ0XHiGQ
         KrvZb6stUa/y1mG4GOMonVPONFrrb3ErNSL3fqAgw1wN5/MN6D3GHwY8jujy6hK/5oRK
         c7WrJNZso0XuQfP2ITGYiJmBF0XsP+SjW0lUKupwM5lHepyNeRfbo+CcdI38KYmpkiHj
         8hAY9WqhKXHJBoGBfLwUiKyC+bhscoo3e8ob2r6NkrhFFsMpsU2hKl1crRbx2sST2ms2
         J0EhE2nP5NErvHsh7NV0lrGTBxePShZmHTvtivP5EINXJbuCH+Y2O49/896PDbxgF1Lx
         vnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784243134; x=1784847934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bk3USZv12WGxErumeiIAVcQcqRoeJeqlNLEHc8GMv1c=;
        b=Q2jjYgPDe2ngW94H1eGYvE1ubsmuHQd4e2+65qyMtzx3yHqfn+NB+VsOvWZXf48dqu
         swWfC8Vt6meEy5Gr6sjYXnGLulanCX4KG4TG1II8CjhSSl20X1a425QtWxuOr7btN1xx
         bdaDKX/ydlUhyek/3FLDDU5c/lReSSeFlyhJy8g7eqg3hfCnfA0vC8+yBan/SE3xEM94
         31ZwB9DVQ5IKxj+nIvfneXY26KyQVSRhTa4juNazTvS3sAo0NKlRhc7AI/DAiDD8dEGa
         cKdgPgCz7HWsqLE12YtvFL8nwf2omIvMTaQjaprTJbKGn88mtnamVGcGtJrcQDKFjW9d
         yHwA==
X-Forwarded-Encrypted: i=1; AHgh+RoGL0Jr/PAcBgUnQAOnkQPxcqyT/VnDzwZUHOzGk+aRbm/zNdkLo45yWRwyribuZseHfL87GjA3OA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwNP2UpChcpJyVhIVoC4YFySy+C81PEj/R4wsHQxQFQHAVMeSb
	+Wc76FbhKwkvyzxx4YSwjyDRTel2KHx5F7HFppUzR9WCx7CaWIIhl580THU4ujgESEY=
X-Gm-Gg: AfdE7ckH83dTduphaLqdd2SSVZzwmopHT1IYfMY8q7NGvDfNDkPUYbViWKZIH0k0OWE
	855R6Bds/UBdfDad46WxlnBGaA4hBobpvJb1XXiO2wfBm3Kh8UcCy3gj6rRT9RAunt9alzRbmBy
	BbBxahnDrj+V8ax7CTWI+jbhiAGZVtnHuOd7OHwwVazZ1eEPvlHQkiD5lfyWh4TVRlbPchr5dke
	J/DlOI3A9IoOGk3jdRA8HcQzi5+nVvuZX5ck09iuPsh10Jr/UXY9oNdk9kEDM/kGCjA/deH0mfM
	JzAB7CxB7ruH/dmkS8L4KhPqAHKtC5uPRFxCOpQTg1tRGWUtLtJ1BU9wMqlIGjmrDd8rQzq+7CY
	u3INR3usgzo4pQrcgHHYSkM50k4xRb/xxUDceiPtKqCVHT73b3x0OHczegCFDeSDhuo8qZA0C8m
	RfZZQYqs5pqQ1TlTQDdcnKtDvaiznR3d7baer415SdRtCyNUDcGP2XGvPAVg==
X-Received: by 2002:a05:690c:6101:b0:81d:a1e5:a498 with SMTP id 00721157ae682-81eedf06896mr7708727b3.62.1784243134324;
        Thu, 16 Jul 2026 16:05:34 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:40df:d071:3a06:1c14])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be90499sm207006837b3.5.2026.07.16.16.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 16:05:34 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 16 Jul 2026 18:05:11 -0500
Subject: [PATCH v2 2/2] wifi: rtw89: pci: enable 36-bit DMA on spacemit K3
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-rtw89-spacemit-k3-v2-2-392b577ebf75@oss.tenstorrent.com>
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

The Spacemit K3 Pico ITX Board has a RTL8852BE pcie card behind a PCIe
root port, but the SoC doesn't have any 32 bit DMA addreseses which the
rtw89 seems to use by default. Enable 36 bit DMA ability that the driver
has when this particular root port is detected so that the driver can
probe on this SoC.

Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
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

