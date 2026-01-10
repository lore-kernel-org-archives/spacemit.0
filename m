Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B5B23ABA1
	for <spacemit@lists.linux.dev>; Sat, 10 Jan 2026 05:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768022380; cv=none; b=gGOz7KoNfPDOqto+VyYLNAeEFywT3GUzlmOGeNdVI1qn+ptCZNyMM/WolHgnlIucy/e0pvPvUCSYYg1m0L94YL7pcMkt859fqwSp3Eev9aOshPae5CNGLIxGbLjHQitLy2PIpS9H2HbtvrchhFN0glliaYD7n2KhaP6i7qcr+3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768022380; c=relaxed/simple;
	bh=JVOErVuwqnxyZxfJUVNdtb8rdirOsuMdezkExIjs9So=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kxOKXq5NTWANq2GskARVkiLYt+qwyveU2RkY4L2TM5PzbbPd2ozIqYpnQURo92h5Hf2DLVTNTxPRBBjcAqpYuAd3we3txRSgiPIfZ8xghYcE7kZcWVkf1hIZ2w5Voe3lGw/uBGnN6kTE/P2ZFWUfITT/aW1b5apIIP/h8g9rfPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=FHBBhBFx; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="FHBBhBFx"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a09757004cso46060045ad.3
        for <spacemit@lists.linux.dev>; Fri, 09 Jan 2026 21:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022378; x=1768627178; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RB1julTcwsVwIqkOMTaY5tjMY89z5qQTP6TBk69d44k=;
        b=FHBBhBFxMzaRNb2o+V99nQ32PBqvmZbnIwx5G+qBbmNBN60DX3tGfMguK7vqGq5wHC
         rkp440haHprtbE3QH0h0bEE/jgau/VoLMzywckVsfPcSPzdg/+jQ1Jgaho/a4B8+3qaT
         O+eheROuuitNWhEg2+L0NHi0KQUjLH+xS8uHyP9D2Hwr9eGYLa2MQxYFHCXyxOosR2mD
         aNMYPNu5Yj56vfgO2cWWSAQfs9Yu90VgagazFbk8FNJMJdSQJ875jusTqsGzmrvWuSz5
         pYzWeGjAmjRG38H25+uRi7tWm/s8+D3IvT//5K9KeWjE72W4wABWwumEZOFq4yaKMZ7w
         rqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022378; x=1768627178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RB1julTcwsVwIqkOMTaY5tjMY89z5qQTP6TBk69d44k=;
        b=xP/mEZpoqNI9nsiFEiWYPGKTk5BgapiSaVbHbPhLSPk7JITZe3fw3UjY6xnvKhCf4n
         lkYoAajkIrP0t6BDMa39GfB+7NCjSva+EKxVK5wVSE48MERpEyLqpNI4z7hlmfTbulcV
         T7Kj4BmUl664jBDnDzZwk69YvAjukrEgPj06GctdonA+Bm8mMq4Ns26mxtwrKtYdBkU+
         oQJd+GyV+idmBmJwDxPon2y1or7TzEHJXkFhyPQScpcwhcTJGE+ZU1XHwj57wN+GjK3O
         Kdv/GbYN68Xhlvk6AAnuGUN0rezgeJH+g3EUsaBWSzFTTeybDyoIu4/Gn42d7DFkiT8I
         W30Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+MCZQKV5nuyCCD8Gp+p7Uupu3GV1ohkEJ3EbmbbXlVab3FCDskNW7ryI02QuHCv48BDhj7C6+UQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8prKyymIG2vNuDI7QNGMLWURi0OBVwriVlRUMynjAFeb3wSZY
	uNiQtDR4kHh4ZanQr0ofc4EsQ7CpU8EgGRSHMywfd22Q0uFhMeDejh61HYxf/wDktY4=
X-Gm-Gg: AY/fxX6o1hrphcWBJv2NGAl0P78LsA4gwwhhiqX65kQS5lww3Mq7izNMVLICNnklYYD
	8a7d8mrzcdkfnKAG4O0jFqicah37ZZ8KNZO4q1yTBe5yF1JJrsd9GbJV5xeF5m2S5mILYNJcvuM
	pRoyTyj46JbIhA2Dc3ATIAQbKxuhAJbIOX5bH8Fu2Uftj/kMBDCI5uKyfvwLXtDVbyX5l12lheL
	NN0hgcGQNZ6qlLqfjRzA6W496XACqylzeX+BL2s1PwQSzAEWXyK2uQoBb2PUJPgVkwijsjNh8eS
	FJCj+y8W4nTc0j8R+cT608P2f9BJYc/HUiHLGWJVBypjndHaXIm5s6ZmLkbXgnAD6qBLntx6sEM
	kx85Cz55hPaKTa9B4sFkz1ZUG21XF/eqPJ3edpqCd8yTG8b69hv3w7op/3mCCa27S36ig1Zwi99
	Xsxe/CWWfNtS9/md9JT+P+uExyqBiRsasRe7YWQ0KGkCdmL7j8LFuoSA==
X-Google-Smtp-Source: AGHT+IEbLN+ufDRbhXFu7As22NIuOsgWDNIIPN8ZaXZZdRrHya+Ppa2gw7UP6RqhkdSdQ7NFe5NtJg==
X-Received: by 2002:a17:903:1a6b:b0:2a0:a484:6b87 with SMTP id d9443c01a7336-2a3ee49c6dbmr128077985ad.47.1768022378403;
        Fri, 09 Jan 2026 21:19:38 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:19:38 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:16 +0800
Subject: [PATCH v4 04/11] dt-bindings: interrupt-controller: add SpacemiT
 K3 IMSIC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-k3-basic-dt-v4-4-d492f3a30ffa@riscstar.com>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
In-Reply-To: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Add compatible string for SpacemiT K3 IMSIC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: No change.
v3: Add Acked-by from Krzysztof.
v2: Fix the order to keep things alphabetically.
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
index c23b5c09fdb9..feec122bddde 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
@@ -48,6 +48,7 @@ properties:
     items:
       - enum:
           - qemu,imsics
+          - spacemit,k3-imsics
       - const: riscv,imsics
 
   reg:

-- 
2.43.0

