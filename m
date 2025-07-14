Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37F6246BA8
	for <spacemit@lists.linux.dev>; Mon, 14 Jul 2025 09:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752486061; cv=none; b=Oc7K2ABeTdJ98AN4i8OWNEnUvcWk+4BTyauinsvm0SrBtCBt1v4eR+M9CvL+YJy2Lo1HKA+p6ET3sYn3o8TXkCJpeaCjGBB5hNQ6pwXRAWq+sWxbN6JH1yyNkmwdFXctyse7PGpz1RvDjhUycd5g/f7Bt6VgFzAMjmna91CcXaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752486061; c=relaxed/simple;
	bh=Kdry2gVbb8miTXmXd16rrT7u8YzjkAcFEZdjgAgPfA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WwFZ2/HSO3wlXsPrKQUeUHF/HUjSxdHgKdZ4z/Ok6bUiBqlIyhZLoIZt3HZUw7brwbO3ip/xHZBt+ean2g5K7qZuueH0gjT+rtyaRHC/+CzrqqioIFYnPwAOfRygGZlsZQ45HNFQgtOogBa8OnN/Lkff0n9g9OED5R8eUf0+FT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=3NdiUWpR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="3NdiUWpR"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4561ca74829so5446825e9.0
        for <spacemit@lists.linux.dev>; Mon, 14 Jul 2025 02:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752486058; x=1753090858; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBgGdTksVfeSjCf4/icT/1ch7Jc0HArkGcJLo9ytMP4=;
        b=3NdiUWpRvGg3QibuBApzVnnzx5c2IV0OPN8OINFnihjCapYC43HRo8U2gOph2WlaHB
         GkRmSEc+z1uvpPPsSNAcS4KQeQS5i1PD0I/cWHUwpz32Ommd7Yg9EGKSpqhSrloi1Gp/
         tTZOripWQ8FICSolZtNDwA0eboMuHqu4eYnqPiAzSF6cwPflpjdI2UbTJqMPHwhdUzkZ
         7GyIdC+aq1P0el3BGuDfbVcQPW33hN4wAghnHN5ma1gR9qX7MMKNj3kc3icP+8Bmws9D
         E/1fAR8Eay+GNCgDYHWHB0+kdizCUHwPgx3yig58GP5pmn8nu6RzlVxx8p/hlYHfzCo2
         erRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486058; x=1753090858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBgGdTksVfeSjCf4/icT/1ch7Jc0HArkGcJLo9ytMP4=;
        b=oJigGANGD0aD8lpUvCbcE3eVAcG6DNWMMDjxM36c/CNVCnGfJqveosTFQYEHZFGQkJ
         0w71ybiv9hKMjsW11eWkXLl4bX3ezuQb+a5SDjZ5qku2rYFs9UcV4ED2FHHKctSOpB/o
         Yepc4AnduIRGTV+vWepxmaqCnXkZklhNFxIbByrmFbtXdolmeMNwt8ntz5bicExsD4H5
         o39v7VT33V1C3LIrbGmMUsRJ8wv2SY2dyf5askrWjqoiFFBM/m1asNvWIvnB3Zb3zAoz
         gGLxmOC4NF5pLslJFlBA5NKRo9NEXw86xKpH7hEMZwYt0T4Np9Y+dLuK0iT7s5PXwK8R
         ZMmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6gGq/yZxSffoqqEwOU1OtvQxKuBI60NHuszd4ydqHWKT0PjWKgBIBWOO3rB6mm+A1U5hmZuImmw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwyIT2joy/xelVkRrlQJM7RxSy6hK1ynaE4pfJsUzniqt4bPNpm
	FwPZ/BEU7lTY3vgEZ2DbOHT0CXPb4UzzBfQVkyifLfnig+6eAV6lyO0bmN6XpcsW0ks=
X-Gm-Gg: ASbGncsMKkKUA0Fxs0qnlwvU5KRdyhNwK1As3sVvZR4+WTM0+zGIeXWovkvxgAA/XSA
	iFl0Du9XQYVfjRX2Lm6AV3TvgLSk8z/VkEN5yYFF5KjbZ15ey0B0nEzN10ukf6jY/LjkO1I7PNg
	PCTxHP9YJs/R/nZdSbz3WUg8AYzTQR4KxQOuNu2tuYps96FJKJSa1CY0Ybt99HWm4chUdW7VKLs
	MT/EE5eRP5OrM+oN/no92STuaxwhckQPftzgPgCwWlYU8gN9cxkbPPi3amwY2MLkT4LkanUqXjr
	WEquoplEDwf4+E5HVNplXApHxAOrCs5hOT07BlAF/7FpH4KfGohx7tBLBKeiljtZvKktcoV6Wg=
	=
X-Google-Smtp-Source: AGHT+IFZBd9BqIW4mTa6M2LIKLJ6VdBKVXcqNR4ZLAhmo9BpW6Qpf38x6Z4W0deTyL9Fnv8RWBe2kw==
X-Received: by 2002:a05:600c:5024:b0:456:1611:cea5 with SMTP id 5b1f17b1804b1-4561611d3d6mr36347635e9.18.1752486058120;
        Mon, 14 Jul 2025 02:40:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:0:1:2::3035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b25a948sm24989035e9.35.2025.07.14.02.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:40:57 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 14 Jul 2025 17:39:35 +0800
Subject: [PATCH v3 8/8] riscv: defconfig: Enable MMP_PDMA support for
 SpacemiT K1 SoC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-working_dma_0701_v2-v3-8-8b0f5cd71595@riscstar.com>
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
In-Reply-To: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Enable CONFIG_MMP_PDMA in the riscv defconfig for SpacemiT K1 SoC boards.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change.
v2: Rebased. Part of the modification in v1 is now in this patch:
     - "riscv: defconfig: run savedefconfig to reorder it"
        , which has been merged into riscv/linux.git (for-next)
     - Link: https://git.kernel.org/riscv/c/d958097bdf88
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 37c98c0f98ffc0ee9d021e4d07aa37a27d342f7a..b6519fcc91c0bb56f71df336fd3793af3d64fe78 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -240,6 +240,7 @@ CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
+CONFIG_MMP_PDMA=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y

-- 
2.43.0

