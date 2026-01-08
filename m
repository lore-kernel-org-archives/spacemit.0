Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EC62FF14D
	for <spacemit@lists.linux.dev>; Thu,  8 Jan 2026 12:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875203; cv=none; b=g8drxEonDyRZvXLLLh0KY5KKd3SJB8S9N4YvCTJKR4W7NqWrzrCIWoyMo5I/hXK3V+5UHdQYNVjQKDT2oWSfw3BYCtY3muv/OJYRNbU1m6WfCbYbocZvZHl1LuctddvGb60BghWgAnJsBlBs6N6Hi9kxx1cschhXtGPO14czpJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875203; c=relaxed/simple;
	bh=BmARFNdMYVDF85A9HHxy7Xy3eWz7vlysBnNURs7Ug3g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KYWmTbebAfvGslqV+ZLYnHpDObhTXhnFylcZqjaQr7fRUdSnYBBX/ZH1TFXMSutXb5CsLwTBrJny7iB4R4R02vaA06ry9S/58bd7ln8uLH0hCXHqC+00ERJOlKCH1VNI89HuZsMWTQDpFBcI3dsVtHtxl/GdM4wOnIvpXc4mKY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=W6qfODPP; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="W6qfODPP"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso2469527b3a.0
        for <spacemit@lists.linux.dev>; Thu, 08 Jan 2026 04:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875201; x=1768480001; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uE1KQ3Nap9wSa7ARNmv253D/zHZAcI3o2YellqaTrW0=;
        b=W6qfODPPX0jGYxpBMcROO60sRKKFQfZ1aSmkID31CUbVR/Vz6/DndjQPlukokB0cdu
         a6AFtVdAmrwf2YG4dKDcDXVq4pnokNEUtSdDsbxYDTb6OETiH7TNQFhUAsXBs3rRxqbQ
         EWiqQT1hk1XPdBE1q6xcRcum3vk626qlAddpWHjL0OcH886exDgXmQRxWF4YrVY80q/S
         oAtaYOZfjJtDX9HBdJZlcWqIDoNh0vNQzphGei0kG9f2wDCk7SQJUxff+PZq/hc9NNCj
         l1mmSm/ajue57xqd4utACnrxc9b6suZOsWSir5LAzySz1Gia1SjrPfmZZlAgjUdsKaZK
         rm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875201; x=1768480001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uE1KQ3Nap9wSa7ARNmv253D/zHZAcI3o2YellqaTrW0=;
        b=SmYG7pG0QZkFeQ/AEEevIW0z5O8YrknEvfXhXfQeNYYUKNho0LR2kBZroBhOP0kgQt
         R2OgKAKGHh74sNocMqdHHKfG9d+RjTycVKeK9Vt1goGXCrlMYfyfRnkfBf9F2umQgE4F
         TmHHQdOzLd/s7KJmea2hpTRBBEF27qb6PW4f+1gqmuA9uGoJvQFRUdyDrGXPERP4ESoN
         k+gfDLtq1TIiE/3y4nRs/Gseh0i2zgv/PzneTmUdn4pn+PoK3HGTqsehkICPVS7dkUzy
         80AypKesIDfNYiqlBqtQUiv23uuhOdx1U+DGJxGxOFjyWrrin6wFZsSMFxhDMDhF1fxd
         ExKw==
X-Forwarded-Encrypted: i=1; AJvYcCUAp7j3rckjcfiEjQiFGQ7Ruvy7iSoj80NN2XRWZqqy8xAkpE/BYaJVWwshijJCsdXd4kplMOsGig==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyuc//2y5wrcmTnNOWoHu/niZS5UcaZpL7TaYTuix8VYB5vcSBs
	fXXxC6pA1J4EV74tS6/1bPj2K8e17ZO/1amQ2gGsBK4yLwDjRrMNres4B847DH5Diu4=
X-Gm-Gg: AY/fxX5RlPoaRCPAkcTC4SCPTDw0Qs4be/huRZ8U+at0qIXmyOVfwyYFOC+K/ffPu7k
	gqH1IpuiQMMvPOquwhJAx9w+w9pssk5RmuvKnz284G8g3LOG06uJ6VM5ktmyXUi2fpVQmW/e6cl
	XIdRTlJug4qxf9Aw2FQjSh0J0Dr8oQB3FABVHiYVaEK5VAilStP7wjU/gX2yhyxeE3I5+OsR5c2
	YX/QDpchJSgXBBvAvH9VJtzNXalNk1pWCu0ZdQg+il8ZNYvg1Lr4l47hIT1MBRoBKflSu96ofOT
	ebaH22+JmMxGKInCMKCTR/9Ei7yBRmfT3sOePrOA6oMzhZ0HNNxBaY5RwO3wkad/cZjNO/Kh26C
	Zen+8EZYYNeEqRKHDixbB89bYpMwHpIq8c2FaD5WFCh6JM2A8AqBR0QjLSs4VuNbFrVhFD//XE1
	ZMOohiXoMRUPyI+QL9a5WXz/EGq2BdIN0=
X-Google-Smtp-Source: AGHT+IEf2mq8ef1YFTNrrFOuAanoejlFcGh2te7djhwZxqGKBzNIruQxKkJjwV3kGI0EiglOFPr0Pg==
X-Received: by 2002:a05:6a00:4219:b0:7f7:2680:7325 with SMTP id d2e1a72fcca58-81b7d6511bemr5205066b3a.13.1767875201339;
        Thu, 08 Jan 2026 04:26:41 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:26:40 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:25:54 +0800
Subject: [PATCH v3 03/11] dt-bindings: interrupt-controller: add SpacemiT
 K3 APLIC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-k3-basic-dt-v3-3-ed99eb4c3ad3@riscstar.com>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
In-Reply-To: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
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
X-Mailer: b4 0.14.2

Add compatible string for SpacemiT K3 APLIC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change.
v2: Add Conor's Acked-by.
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index bef00521d5dacc002d24c50843ebe6380a7d5524..0718071444d29fbfa36283fc9666e8cecd6f77e7 100644
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

