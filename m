Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5852B2BE051
	for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408827; cv=none; b=PspxATrQxEPgDUtk2htTHFh4c1mX8li4XC75gGI49cLvGB+OsgS+X5w+fSdHJwRiy7+aAUXUzfLzH166WosGd2OHA5FR1ZL7lA7zfj5nEIgaFuJHZSdxeLhQHlE6ZSRgx99+4jnpA0cC357XunofJkTWwftEESNoPXT73vLe048=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408827; c=relaxed/simple;
	bh=NeEncG39DCyrTFRCfu6Y0tdsxFc/enlLbR5vGWFwB2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlcgM3d0Md0vbafzZ4Sta5rBEFbJpLFwrc1senSlBovl7bIJJHziPlpFlQm4S93VWRqxYQZKt9jo+E2/QlL3AU9pmTp42u4Dk4QjW5tVSv+Qh00JUNJGb9aATYTNkpUJ2bkdPV8Ut8WcVEt30QBT86woeKzZMedWaI4+VOte3gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=lYQvMrkn; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="lYQvMrkn"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b80fed1505so4141688b3a.3
        for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 05:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408825; x=1767013625; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WjWQje/nveRZYVRefE1HPRIex4imNRc+7jk18aMfa5I=;
        b=lYQvMrknjQz9eQxWfP+LM6Y8b40OVvHUb85d1nejNTLW9L7sYejBUr39m5aux/gg+n
         Zpw364QEx42Tv13UYBbiuIC3IWC8qkcoCsjhuZ0r0ZqaUMavEx4gbJue2zxz9HQ8Chr9
         We7sONFMLUjgnv8KahAHwr/MtYoYIvAESgEt2bGF91i9g3RQLbR9jnL8HH2lnT2bGJVO
         j8WuFGebwcHUJxqtnQWaiJTLPvPgqsuOnS2UTCtq8fyS9rgo37THIARX7GEWiJrptH3y
         MtSCOVfOoeNMKln7WX/6Z3U3xivW63Xx33qgpqQ0SVEBySCpVyDzpGzWULc+QipAzmwa
         5tsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408825; x=1767013625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WjWQje/nveRZYVRefE1HPRIex4imNRc+7jk18aMfa5I=;
        b=B1Q2ZVkiM62LPy/8luEjTFQAcdoemP9eEdt331JX93L0OPlC1HHyuB+K0bDNxAo+Jv
         bsV62dmrE+jdsEWyru1hNRsgFgjQYnk6LKIe/YbfdZS3bCH32uxEU1cSCXN/wD3BWk74
         khztddXPya6dZMGhF3QyfP+SKQTeRxdJSZul4t8FtKEAsp2SarHgMzeMO4rL5RJEHF6d
         tg4kbUd2hcQrfmDTJDZy7OWnGD+3IwJ/Ga2di3g+vuOg67Xg7kFxujsUNWYdLHCW+WSG
         FSXHYrcb1VyOl0DIm8C9fPlORJBW3YrwDU1lkfGAQXN94rps07Vb376ZYD8MMBCfgLaA
         DZxg==
X-Forwarded-Encrypted: i=1; AJvYcCV36QJy77Ng0vtmqb4UusNWb0Bq/KuDMa3+f7ZyWnavSv3jGQBWoZgp59zQKFv1Y5/szYxqciOkhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEj5W5AOPNnLj5vZPEqfFLeT5Zep3Rtg1GoGqkvBGeUiZRqPbj
	6jG1De0ZdUpCkkzX0og3MWa4MjrC5OXaYIv+QJSTrdxhU4i7fa55T4+97CS2qcNGoTA=
X-Gm-Gg: AY/fxX7EwKb9fsCVbq30zuv2JXA3YX8Y2TmK6m2GZ8HrbLgppyVWcY4qvOkhWd+LdHF
	D6+gVLbNYQYf9TSkvQ02IvQu9sHzVgcnxPjR+b+QyJWcL1BVuB7hvBa4bxMG3mkNnG+tGHIHUfY
	Y8mIGLvHqYlZMW1JJ394HJL+/V9zOl2EE6mtRuIymVZU9cMrkxe5x31OTtborBwy5WRqkE0cAon
	SF/TuIQfyZoqZC1KPLwgldsbYaaqNY42s9PBOFIjp/nC4lDIZ+0CSJFFXbAWA0sFhwrMamIhutf
	OOombdQ09XepQzTib9Ep5R6tVGR62dDlt01HZ4YTt4BX7BIjCvd/pYHgeIhLvMNbjmids+Iu3t4
	1ii/4Ddjz2dXpIPb/tbjDSy1W3rw3oe3NIU+iwUxRK0xvLq9aBMibAacLZBaJXhRK6Zdr/K40VE
	EqhDhV1XU/6I6+HcVcMTiZiz0bAYRx+W0=
X-Google-Smtp-Source: AGHT+IEj6B/u6xigsQCz/iBhHquF+WSZt9ninqdaMIjKJZ5tbUeL4Vlu+cYsAEqQxRTbHzVXks71pA==
X-Received: by 2002:a05:6a20:918c:b0:334:a681:389c with SMTP id adf61e73a8af0-376a81e2a6dmr9033482637.15.1766408825385;
        Mon, 22 Dec 2025 05:07:05 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:07:05 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:14 +0800
Subject: [PATCH v2 04/13] dt-bindings: interrupt-controller: add SpacemiT
 K3 IMSIC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-k3-basic-dt-v2-4-3af3f3cd0f8a@riscstar.com>
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
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Add compatible string for SpacemiT K3 IMSIC.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
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

