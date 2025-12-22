Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B16D2D8360
	for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 13:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408797; cv=none; b=YzfJbrX1VW8N15inJRJ3EGByr7FlQejGiiJIjvuH9xwW/58awJ20GktYWdgQ2O6V8wiSKCmlRyWOu6uJf3C5Z3Pv5Ms0iRsDK27V7uPCzCCE7rONVpnvlzdLoOWrIvaEs0l9YE9ykPRin/GCLRRvZ0zoNeTYAwA2bE+DLN1nbUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408797; c=relaxed/simple;
	bh=v1t1naZGSzedzZUjuL1zdtf39V2v8+wzQD5LmHlpe4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u/hqsjENm1JCs/tEUzpMRQQl44k5onFypAqLyH6ltHRXYRgaOpIb07DeSdmxl9iponuyLFCG5hmw6VitXm0gAgDExPoCDBGzOVvCfzoIiuOKciamZwU+q8ZOS4QDy78Kip8fsBHxQNiVMeSOaztLEFjXWvEktm86vpJ20Tercik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=NK92XztT; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NK92XztT"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34c24f4dfb7so3005601a91.0
        for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 05:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408794; x=1767013594; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XgdTFHMTCMlAmy2Oru9A0Zg9E+ZEm3hyo7Svl62/2oA=;
        b=NK92XztT4/OhCUwW5STwNQDHxMu1aApgkRzOBjvd74l5S2NlmQYP5SFcA9oJuz4JmE
         OP+wZ+0r9jOTBr92y1b+B1EEoVZCRBWnjqUtXUcqkhLJ1AgRg4B/B4WfAhCAoAW3Begp
         De07HzuIUGcLlFJYTUNtfdmqAwqCJZeXhd4MQvKZDQY9S5rvoisaqM5W9jmyCamyTkk5
         3JeO0voo16X6PEDqeTm8InZydM5rZ10WG6OAvqFmzjL9psMSNZCQbf1mfVuYdsKuR06z
         6xtoCOqbryWOfHb7G/EzBE5IhIS/2MmiaN1vZvhrC6/wpdc9xTe/TAOwkmbX22qMZodf
         M0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408794; x=1767013594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XgdTFHMTCMlAmy2Oru9A0Zg9E+ZEm3hyo7Svl62/2oA=;
        b=Ve7KnGyuCYl0wqFdzv90BPJXYTUNMvtkDRehTZJGD9SJLM3jLRu6ydYmXIr+JxWkEk
         2JphQRPyFzbggqZpJgCcA50fLYE8shBDR2OFVMmJgoFcfF5mXyCsgbFUISZwm4LZP3Ty
         TdLvvPfrfz37nP6I8VZe1MFumKRZtFsYUQ/4S/IuXpi5TYcscpCe6Dnylvsx9HB43PKD
         q/VGLgWhqYNR+NYaA3G+8l4ZyPH9YAcTSIELms/hyF0ZzYEeuuOE8+SR7eRrrVEh4dB+
         Igo28v5fWnz1zl5/xsyOCNxzeUu1i/bBYFqw7i/gqxcEPI7gbpdZZDefILzqGEoUV6Ag
         FKAA==
X-Forwarded-Encrypted: i=1; AJvYcCVWmQZXH7BZP1O9nIQSCsUlew1nxxiGaFPdz7V+pOp2ZAqRy2FxK04ka8E1A1LFobSTUUDBFnVHlw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzj6wgpVnGJQDejOJfwIIR+lyoJHWvbuUu41ZzDM3/M0iO1GZe7
	OosTNRpTnm122+KkFCEVlgi6Wr9ZjcnWRbvVi6P4jVJGY73S8GBc3D6ktSDhhgl9nK4=
X-Gm-Gg: AY/fxX4FO05jgGDz+IiMPqhXDKw0BPNHUiyeBJfA0q7YpWvNPaT+FZTS0Kiyd0UQ6hj
	9fgEupat6o8+7KG5pfdpVaDxmPyLxczvDE5pd7PZmk03MhMyKbPyGyJAYy1qULACdiutoBVidK2
	ZiJZnCpQ9xzOhYnvp4TtiWT57KrS0v6qJ6de/nR7Cv1rjGwQXsTaAugAJ7+xHgPNGQ3kVwpPYvN
	c/G06u8FkD2Xz03N7lmA/K8fabJVasFX8zU6G50Iif5MoS1kxtAryFiaxoz1y3VlnKd/hgsa1FN
	9Vt5rpwRTY8C/+W+4VTovdOeWokdzJHtkR/Kik38ds8qxJcBA+F+WVIOwmV+SmvVGF9KSqKCstE
	Es0DfAVKC5zwxcQfK8CWy2Wn1oVtxzOpuLj7WKuP3oP33QhBrXaGgdl1pzmzTtmvd1ZWULmcwes
	/HbKd+Kmk7W9guNqrASSICpaiQMyqtahe0bhEPBUz3+A==
X-Google-Smtp-Source: AGHT+IHxNgi+B0C4X0RL24+gScZYcxvnEH5vGDKHG//0EVTSEFa006bU6P/YkBj5P6dINmSvw+3QjA==
X-Received: by 2002:a17:90b:1dc6:b0:33b:b020:5968 with SMTP id 98e67ed59e1d1-34e921be2a1mr9160833a91.21.1766408794105;
        Mon, 22 Dec 2025 05:06:34 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:06:33 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:12 +0800
Subject: [PATCH v2 02/13] dt-bindings: timer: add SpacemiT K3 CLINT
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-k3-basic-dt-v2-2-3af3f3cd0f8a@riscstar.com>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
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

Add compatible string for SpacemiT K3 CLINT.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Add Conor's Acked-by.
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 0d3b8dc362ba7e8d0ca6d0cea692ceddc5e1f89e..3bab40500df9bc2ba4f7d6f1bf340c8cbc06f9de 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -33,6 +33,7 @@ properties:
               - eswin,eic7700-clint     # ESWIN EIC7700
               - sifive,fu540-c000-clint # SiFive FU540
               - spacemit,k1-clint       # SpacemiT K1
+              - spacemit,k3-clint       # SpacemiT K3
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100

-- 
2.43.0

