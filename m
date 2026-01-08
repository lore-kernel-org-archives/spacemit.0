Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3822639C645
	for <spacemit@lists.linux.dev>; Thu,  8 Jan 2026 12:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875214; cv=none; b=eQY+3CjNgBGLf4hii3pz/5GLCDwmYZvpNn4yJXNKryFSpkQheL2kaP23extmsEF1qBANC0J1WRlnrTdZSebgfnUET7I+xEgOsp6LP706McVL4Ep8nodjnrD95ilOeNVzGmZ8bHzW8ebj+6MFr16nWF9jcEPmiinP2UH8H6EXLek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875214; c=relaxed/simple;
	bh=K37CDQVk1qKhIlEnznd2RkcI254RHjk8sgFKmzbozCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fwm2FiA9uMGAp6R6xAiptd9jODfVkTHj1KB9pwmXuQXX1Pu7kGAmXiWn37bnR/vtzmF5FPECtBlXNXhkC1r+8si+0bCwWv1oWY6qW4GNkJmchNM/8IemDdNQnpDR25hWkfdgysiogaAnyjgvhT+J7ML8W9mJKofVsiLmWkRrxOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=s6DznCyE; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="s6DznCyE"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7fc0c1d45a4so1887036b3a.0
        for <spacemit@lists.linux.dev>; Thu, 08 Jan 2026 04:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875212; x=1768480012; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Uu81D54FMEFR1KBiicj40Orv/JnpYImdvG8u4ALBqk=;
        b=s6DznCyEIPRMZj1rBLfOrHY9hoik1lxpaTvCJ87onwELborrLxyuzOY3gHcsZk93oN
         fJr+rSaoDnL4WE1/7L2723zRdGIhYtvAdBEPfgtWc7gLVzR9Tur1QhG2M2FlTuWX8yWq
         0NzJtG5yUrUelRSm/2uxrNFxIGpWy3DEm7McYbQnfwOt+i+ItT1akFx4PY6lm7D06Hrk
         1oge+nQeHX4QilekdcIhKhxPZmpF6mndtfkdMERdXpsxrO7US9s7DC2WeMcbQHOxIKqu
         O6Aq69bAtNqZ1gRsi/IxjnZ4Sso76TGcnkbiNXUCprSJr/ZeMI2Rl83inzbQN7Gbaokn
         wLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875212; x=1768480012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Uu81D54FMEFR1KBiicj40Orv/JnpYImdvG8u4ALBqk=;
        b=YDQJhPdcOhQ3EPBmT+Ni+7iP8H2dW7l08pH60NVVhuyzvd63SIQ+MWRGDha9zdaOsN
         cI488ORqcFszTbVLkmvn+ZYWzkJaRIuDeGHwZ//b7wiJBBVWkjhwngtFQdZzmkXHGBOC
         cR8p3OWsb2nlljiYfOyxV8Zw4pyqEPpTSc49LMZoJWlEQtRW9+/5l4/BnmThn/mv98QB
         c9MunOB5j8SbkqRsO2PASGCTswnz4+XTMbKoO4rZvoTgba5wdPp0y4gQQhF18cNkyUyk
         btuzrOSESYaCSfo0D5hK/qPFGn3lwBFk0Ne7HFIU98Ld3jW1MsdWqfYdcDNVbGA0AoMe
         80bg==
X-Forwarded-Encrypted: i=1; AJvYcCU25D8wUdePgkxMNkAGA66MvW6dIb0ZOcLXZq6p7mnZxok/I0fEs4Uh7ppQIl2G6CztM4xIt92D8w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0ck7/f/XFsc6fCeiYfAnrydu58byhCSC4jMfihwyNeNAsyKtB
	du16Ir3jCQEjNLrseuLTbTAH+qrVSymYO+sDka+o3+WquINln4dm0Fnu+SQrlfhUbtvvIRrz4Gd
	RWrRbUzE7iDi1
X-Gm-Gg: AY/fxX7CuvwO2vc2s0RBXJBfQHwDI3oeidDXHNVfW+8axoRUWLAlHBdHpYBzZEVO7yy
	HEyoc+JpK82dKR52rni7nayS6+4HvBHL1QmkClwguWVLQ24YvishdqN8xuL7fzm8ILUixv1wDxy
	/pfL/O8jxDhF/ycQCXRtPglvhMlkaPwC/CCWW76hFhslBQ1xYkoJ+8jGMUvoauFEa8XoFK8I147
	ZTVXKbbvahBLFFxgGW9kl6Yuek+gDyqD4J2/F3ZTp/mZBP+rCCUckGA2Eyr7tO05Gdu+r2dYToF
	2IvCmlxuvd5fEqWOELrkfbj4obEO5/SO3HS82Q39ckSz6XTSRtM9nNdYIx2jAZXO11CoCKQFTy0
	WT+qseX5tU6U4HUVGFP5hKRr9ZIW4hfcS9TF9Tb3Yj5vIbwBQZgyl3hoCMPR4/RSL5q05DdGSk/
	Y0r5emQBykw+IZd0ieSP+A5c84sqphMII=
X-Google-Smtp-Source: AGHT+IGjXfsog98K9N9BmFt/146sG4w5oYOSz5QSQHD2sWVG91brHPM0hOS0kYWXqTMiNVr9IiT+oA==
X-Received: by 2002:a05:6a00:3003:b0:7e8:450c:61c3 with SMTP id d2e1a72fcca58-81b80ac5a0cmr5573634b3a.51.1767875212553;
        Thu, 08 Jan 2026 04:26:52 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:26:52 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:25:55 +0800
Subject: [PATCH v3 04/11] dt-bindings: interrupt-controller: add SpacemiT
 K3 IMSIC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-k3-basic-dt-v3-4-ed99eb4c3ad3@riscstar.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add compatible string for SpacemiT K3 IMSIC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Add Acked-by from Krzysztof.
v2: Fix the order to keep things alphabetically.
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
index c23b5c09fdb90baccece03708f4a381084b22049..feec122bddde1f82cbd29b8f3597d6af1a16cb23 100644
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

