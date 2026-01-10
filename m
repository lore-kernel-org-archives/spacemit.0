Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41A6212548
	for <spacemit@lists.linux.dev>; Sat, 10 Jan 2026 05:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768022370; cv=none; b=Qi5fymb87mm2i+mxJ3/wqdxAN+NmIhAaXOgeakjH//4+pbNmOU4P5A4GhF/LbdpGNA/qir+U3z11fFxtrdfMfwnt2tBboz9X/hYZqYhrxglzlLIVrMJXymy41bO0im4rjUpxQIqawk2COTauZLo8GeBxm9GtMhyFv5pkHs6CiPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768022370; c=relaxed/simple;
	bh=II8WFpH5JkBA2vO5Ewa8JbzAofV200Cwmh6BSNiyENw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ag/THRtZncBld+4wP9WTq53WVkbNSHDfYF6bayM049VhmIQW21eyzLi8yqdtmOwsBC+J1d+u7DfxNg6QFC0Nj2enQBBg6h2zsJcT74HwPeFBs3Fm6ZNypq6e0eRzQvgeqodkNqzm+va5a+FLyhBLIwj0BRrke6aDw+/ZHDLHuLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0/fQuHPM; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0/fQuHPM"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so33602355ad.3
        for <spacemit@lists.linux.dev>; Fri, 09 Jan 2026 21:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022368; x=1768627168; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4Geuz70LTMH+K1+IqxpgAgsSYEP1GMgnx7rbwvE2Nc=;
        b=0/fQuHPMeIF7VU6Iy4HN1dsxs+rZuXEajg1ojdMd3fri0P9N5b8h1ZduVZFSZj+zP3
         FjYvOgxZnvoe6RIfutKonTMQW63kxZXm6Ux0JjLtfzMS8iGigsycBRTqtfagygMHbyIV
         O+sQwsBjIrccXA6yAJb8ZyeKa9b7SycwG3QOsBpd7ARBwb+yWMP/tfpH4Wu417SQN1b0
         pFMCopmLHO1TW/th4NSoXN0+jFcfzHOSTZLlnOPWrNACNO3IQ4gtdmhF3HMtb0OMQaZg
         CjvhV35C2XbbCCvbB56CGgGbuXOwgJPJXvPlKvTTzYVKq8HnntSiL0lUaU8NChEiiEtC
         fwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022368; x=1768627168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4Geuz70LTMH+K1+IqxpgAgsSYEP1GMgnx7rbwvE2Nc=;
        b=mQoQCvaRdkKIcEArS8QUfIml3ZJx6DcCjKbB0RgvI89ZfhQ6qDC9iKmQ7PFGBwEz4/
         Zf/AOLumHWIYR3TeB5QPRTsHnSaBGU4o8ilKTQRqWuygaEarBtFCYJ9W/4alZyLd19IX
         6HW7EFQ29/GeQjKXtUmNjQUnAa/q6an3r5j1Xh2u2nY1FBmUbcmxO3JrFZzrtqhxdqHa
         nTWGoOd6JEyKxfW2//K90U2kHUbXvolubWsCuUSFtHI11IUxbjFaBRpsjL47TuBJDwj4
         8BJJrR8J1v+upGUYja9K2POu2w6NpqXtlV3sbgIpvBq2AyC0hqvoMgSJCrtW9vTqhs5G
         nblA==
X-Forwarded-Encrypted: i=1; AJvYcCXWFjt+hmp8u8DM1JX5Iy6klOphVG1bhgIYavxPxUf8eRIAV8bX/mHehsKh+svKhM/Ty61P3eu0dg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzH9rHhf63fFUFw8zj3qTSMkdXJ145IueFBJY3ijjtLvdP8QAzM
	IS4IWHqYG/Socx6pEy3MxodJYr2N97u9Il1KDO9vZd0BKpVPxS1/acMHFZlc5eUq/iQ=
X-Gm-Gg: AY/fxX6ZEundKE20zN/7quyc0sNW141rzS/YtLwSusP5BQYHzRN8HPdtmb4DuCyBO+C
	/k1ZO8O8Cliqpf8vTTqM6yMqisZT8aO4I9nyWpa441RjLnMZPkgmY2h7FbYvVnFCkZv8mZHLa73
	nUi3XUhlvWBOYUXP9aKn+/RU93J2dTWnpbaOrvmnbKghiFyuL8r1eukXDdnyYlQQoYzsBCUkIgo
	cvm/0Q6G4OYnT5E1qgAQWTEWLlCYaQmVDytSfhuVriYmg6GHB+soCE27xdc1/cS0wQhxfOQ+cDy
	W9neE8UBg2LoZ2Kl+5IU6ZnRfT7muhL5sWQ+nNarxhOnCehF2e0IFWxsj+iSsMzKsBH/Bv+vtCX
	Drc0stkpGFHWMUf7cHsz/jr8VkxkPCrlbXkVSHIpdpqTm/2G+vol4wYIIIbG5QJ2iyaCzclYN6r
	tfZro8r9wKX8pizEdSlJ9iZAjymR8FD3u6bgWLXypIrkC1/ftSfiVeXQ==
X-Google-Smtp-Source: AGHT+IEhV3ebl9s1TopC0pjYDvYSTyDIROwqkU+RDAEMZaVwRS5ET19VZ04pbXXlgHjjsJSNiSZYpA==
X-Received: by 2002:a17:902:d58e:b0:295:1e50:e7cb with SMTP id d9443c01a7336-2a3ee444aa2mr109871225ad.23.1768022368123;
        Fri, 09 Jan 2026 21:19:28 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:19:27 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:15 +0800
Subject: [PATCH v4 03/11] dt-bindings: interrupt-controller: add SpacemiT
 K3 APLIC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-k3-basic-dt-v4-3-d492f3a30ffa@riscstar.com>
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
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3

Add compatible string for SpacemiT K3 APLIC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: No change.
v3: No change.
v2: Add Conor's Acked-by.
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index bef00521d5da..0718071444d2 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -28,6 +28,7 @@ properties:
     items:
       - enum:
           - qemu,aplic
+          - spacemit,k3-aplic
       - const: riscv,aplic
 
   reg:

-- 
2.43.0

