Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C977C28152D
	for <spacemit@lists.linux.dev>; Fri, 22 Aug 2025 03:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755832035; cv=none; b=UFwHpeCVjl4bDt/KLtfo6rX8YcZ8n8Ju7hc00by0x3Tb2p+YNEoap1Le9wuxmFuw4DpvqfyZQw7PLG6L0MXktVcIYAJCnguM8Dxr6fd3OduytqviC/wfjxHpD+aiBGL1PT9c57GUhKZsKHIYXjpElFEFrcOfb+jfWi0kKslQknc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755832035; c=relaxed/simple;
	bh=BCHnUU58o8kcbkrtBnovBDjIBR3GZtD2vocIDuWis4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGToWyh0sUBkTHNT2GPlhKCdJ81oZ/RbpwODgB1U4cTaU/iZwzQlHauAnuA9amhKo9Jcmyw4Q6C4s1wBgfwfubFWu6+gyx8Cr7rc8QDhqjPq/1kb7S+km9OgvfZSWzKKEnYdg4lL/RTwED5E5NmMuebSWRHnev5s0krko4z7wsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Emj4tZi6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Emj4tZi6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2460757107bso12656385ad.2
        for <spacemit@lists.linux.dev>; Thu, 21 Aug 2025 20:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755832033; x=1756436833; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=quTPMYj7s5QwSm0woBLSQz7z4VVYjT+IYu8GwKKHe24=;
        b=Emj4tZi6ISNtttBpYS+cPazC8IcVMo8VlETcIJq87bpZTXFWcrCq159VXbbEYiLsrC
         IO2VECGVY3uUu0aAJthtIq+csoblb+97vW2RsRiGvqlNo6tU1vr3V8tqo/NJtiofQ4aL
         I8JEBOsD8aazvpxeLqKk4yPWH6t+m2+qUIny5rryhpPbmEqaBOms26EmzVrqSFzvN7oB
         EEJP3Fp1sZWP0RqhnL4lTU9c63cJQ76s2nsT4WJCL2Zt7Otml/+XGJswY0otRgbw6HHE
         bXCR87u8k+i/e9bAKSgVmvJQC+gBc793v+XeNekHJW+6azWCVNPZIEA9btVM1K/1+93a
         DdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755832033; x=1756436833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quTPMYj7s5QwSm0woBLSQz7z4VVYjT+IYu8GwKKHe24=;
        b=uCL4IydNA3cIsOz5ef4t93+fzojBfs0oG775zbHQbJIEo2Con1vYpKmRoTETFFTGGi
         3bgTtxTpmJCBuz/00P0qNtCE0AwyUWV0rjGeb55YlfkRoPhNzM1S6d1/eYxEGBShN64q
         qsrr0FKe5FbUrRtlwuol9cHjFGrq2JYq1fCK9FFj94wi4Ui5VB5aj/wgtNvmJWgI0FMA
         d4ycWNRq0A9BRq+caldEeMPSNfBaFasgUIgONiHMDVamam0i1cLfDMrBkYjrZVH5GmKS
         LnODzoP9yFotIaATRI734pem5A/NuF892vLmmgcGUaLa+4YeEPQGKNHcRqLklVrBA/dh
         nsiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGyPsw+k0tPOGfKyIGD/ZIuC8FTMmAsEMp3gvHmNZPDgTa5xM1A4BBTVCt5/Z7i9AmBZKpKPHasA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzcbYjnw18J0njqJveRaJe0kc25cm48JT2o1/hWhVN1HN9V9Yp
	s7/au/FkLwDfDgPkKHwtCpPRmxw14IfSWkfpBSSdr77/CxDXUGw9oNKtZRvSra9e4Is=
X-Gm-Gg: ASbGncvKqSn355FxUOVxL2NvAqkpVPB0L9QaAbHtoxtTD/karKl+hqc5QqaQiO7E1Dq
	IOUg+4eVzRyLrN683es3N10jzHPUnZvlQoyHq8A7Do44jaw7rqqHYlw9w3I4Fm9Wfc7xIlhG5Ie
	58ekTZJucbI6jac+8p6oc1MD6KSM4x/GnFnkKv/oeUnZDVl7KyUm6xRsXdw4f6U68xJEyKlEwkg
	RH8ZS4OsONgPKtrb4XVHwFL7B/wYiKf87Q9DwOlhWa80njJs8bBAy0frGA6i2PqWlCp7gjO14E3
	N9MpVlHEW9Fo097na88eyhj8mRaaE5e2Kark7r+d/lJqZICSAXMYUpAmPYYcahIs/1ctI2XJYmb
	fhtDN4CSlgeK9nO9KnSPaew1jkUERk0lVrg==
X-Google-Smtp-Source: AGHT+IGxr6BvRlq9gDlCAE/XGtF9F2t4Uze1UvterPKqOgW+FIUz6fdAVotEWXje2mAfPXpMbJnhUA==
X-Received: by 2002:a17:902:ce91:b0:234:d292:be95 with SMTP id d9443c01a7336-2462eeea5f4mr23986195ad.42.1755832033132;
        Thu, 21 Aug 2025 20:07:13 -0700 (PDT)
Received: from [127.0.1.1] ([222.71.237.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47769afc1bsm2756777a12.19.2025.08.21.20.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:07:12 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 22 Aug 2025 11:06:34 +0800
Subject: [PATCH v5 8/8] riscv: defconfig: Enable MMP_PDMA support for
 SpacemiT K1 SoC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-working_dma_0701_v2-v5-8-f5c0eda734cc@riscstar.com>
References: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
In-Reply-To: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2

Enable CONFIG_MMP_PDMA in the riscv defconfig for SpacemiT K1 SoC boards.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: No change.
v4: No change.
v3: No change.
v2: Rebased. Part of the modification in v1 is now in this patch:
     - "riscv: defconfig: run savedefconfig to reorder it"
        , which has been merged into riscv/linux.git (for-next)
     - Link: https://git.kernel.org/riscv/c/d958097bdf88
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index f25394d088d0d3cbee41fa9fb553c71e495036fd..b9ef2da15fb22f08bdb5ee5d1bba9f6eed49ff97 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -241,6 +241,7 @@ CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
+CONFIG_MMP_PDMA=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y

-- 
2.43.0

