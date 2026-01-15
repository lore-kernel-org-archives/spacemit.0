Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B4C30C36E
	for <spacemit@lists.linux.dev>; Thu, 15 Jan 2026 06:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459979; cv=none; b=JrN16rk9LDH6m49Zl4dtOR8JnPg0+2xFSZ9k630hUxKR8LkYENkclGAjJkzLdAgb6sBqZLDeQ2752K3rj7C4iLEw85V1AW9e9vsND2KobiunhO4DCxjez/w31WCZWqArCVdOhH6ejm5T4Kg4za5wg0MfoPWbRpCFT4ILHO47RDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459979; c=relaxed/simple;
	bh=k4VYJTSgNG2EBcFca+PjRqHwafPCJ6Z9F1DCzhfpcUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hxOBJp+BHkROqIHSwyY1PN2SY1AshsnnmYEoupetDyjt4JtNoxoj8C6GchEzmuUZJOy33R1ZvJ+ebf/c+mW0m7+QL88wHK1IfL5tw4jCh+t8ndMaQLz+kAkBhupo/wkOloLFgAmkumEUelco1GDpSvtC7rz2xXTQT0knZRQ4nik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=TjqlApa4; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="TjqlApa4"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a0c20ee83dso4717795ad.2
        for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 22:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768459973; x=1769064773; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSxOkq26KY5aFi9jIDHJotlQaCGxwZHXeVQL20enYRs=;
        b=TjqlApa4y3Y/xDlHXsF8l6dDBbRQWk+/3grVqvnWUTSYsKqFdnIRy8Sb1eL8tAZ3iK
         XSVyVhOzV8SwAn7idA8dgm4mZo7m6VrgiqaRxQnMWl6gVAYWMGlsoP6/03DL99orQdlN
         HlMTHeHDzwdH5U9d/g/f8fUk0/x40pQ+U/4qHAXi9ldZD8kCUf56CwT/DdSmFzAzchzN
         jMHQzUTbHLL0CW3PefhnFeeCRBYqr2WSDNMQEAlDS+3snPJDPJiL0iYG7cVhDtU21ZSg
         fL9fGDZHf3L5qVf3nIvkeKfwEtQRxaT4RzqTpepr5o9OdiNBTykzUC6lrmIRLzQzWf8p
         QeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459973; x=1769064773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uSxOkq26KY5aFi9jIDHJotlQaCGxwZHXeVQL20enYRs=;
        b=BR75PLF5N1IuWYS9+MZCKervDx8RuOw2pt/ucHF3HeT6vqjOCzgU1E9qC35i4Iluvq
         e1re+PnyMuqwaOQTGmZQJvARBJ2GyVCERvalmmMUzks67TRFyi1Wxnfv8rTb41A6ZxWn
         BW0XFJX1XPt9Zc9QqWwCMS7dY/M/xBkwJwiGAevQIGzEthoXiwvo+xRTVrMGFTsj/84c
         Xfu6MKBYA8Y/0Lh/9ZeLG61KM8XwuimaCHsu9oZALqtJ7KbIuvD4WXNORXoUduj293tp
         FjJ/VrZdbjdRiPfcIkwBXjJBzlCpQU2RUR02vyGDaBBwR40eeLhOBQChFqPAmxpnHDD+
         EY7w==
X-Forwarded-Encrypted: i=1; AJvYcCXwa0WHXal3wn0MzYEJ8Hte78V2RqZunYLsTNiUrFhAbH3lS6ULHFJ7Yepb0rLuTDK5PXYcOdbWuw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1lEz6Gwuy7mJFk0aHtX0jiy/7tc9460wgNx/SgdwzUbDOiFqN
	rAfP2ugLh3rgMP86v6WDX5qdx5kybZYg8Ixbj64fN7RPL8QYehixQxmRFEerkV0/PQk=
X-Gm-Gg: AY/fxX6mAqUZA7zW7Rgnqiq9fNdtCB8YR+QCRoQrr9Ia9rDUg/vvsPNfEBt8sjzh3mX
	By2BI12bkFnDXhCuLgiT0bpWV1nNuBLUE6vxeYQCs/1wG5tSkMmnueI2WB1CT/K3KrJIA4ZeLJD
	xB568KaEh3cxQq+b0EX+eA2Cwu/3Wtyp7ghd2FvT/10eySH9DZa88gnajOPTjadzrbfxcdyochb
	zbAxF/qwkQK3w4/Y8RQ5lO7F+6MF4a33sAhXpW2U9sWWU7gXpQOo8Lzu4aPdv4pnhI0TupdgEAC
	WOyMUb/j2WDD+59hjKnqRQIBX2vCX0o5Q//GoUYpqElrHkyhQK+LTSC1FQOFgFyAWg+viSngqfG
	MEJISGktu06oSF+ZsBI9uM2776R0NH9FYkqoFNvLkXJTKXZTPdNPRBWG3BXy6SJ/t0aiHncXDIK
	gH5KFSUKZ56BFMEyGCJnetE3P3yj7SjcBqWjNoBrpuIqA1XqPy/jwH8w==
X-Received: by 2002:a17:902:f788:b0:2a0:e94f:f4e3 with SMTP id d9443c01a7336-2a59bb726afmr48755255ad.23.1768459973590;
        Wed, 14 Jan 2026 22:52:53 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e7a3c6fdsm235081015ad.15.2026.01.14.22.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:52:53 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 14:51:44 +0800
Subject: [PATCH v5 5/7] dt-bindings: riscv: spacemit: add K3 and Pico-ITX
 board bindings
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-k3-basic-dt-v5-5-6990ac9f4308@riscstar.com>
References: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
In-Reply-To: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>, Thomas Gleixner <tglx@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3

Add DT binding documentation for the SpacemiT K3 SoC and the board Pico-ITX
which is a 2.5-inch single-board computer.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: Add Reviewed-by from Yixun.
    Add Acked-by from Conor.
v4: Adjust maintainers list in alphabetic order.
    Declare spacemit,k3-pico-itx as an enum, which can save future
     code change when adding new boards.
v3: No change.
v2: Use one-blank-space between name and email address.
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 9c49482002f7..b958b94a924d 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -7,6 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: SpacemiT SoC-based boards
 
 maintainers:
+  - Guodong Xu <guodong@riscstar.com>
   - Yangyu Chen <cyy@cyyself.name>
   - Yixun Lan <dlan@gentoo.org>
 
@@ -26,6 +27,10 @@ properties:
               - xunlong,orangepi-r2s
               - xunlong,orangepi-rv2
           - const: spacemit,k1
+      - items:
+          - enum:
+              - spacemit,k3-pico-itx
+          - const: spacemit,k3
 
 additionalProperties: true
 

-- 
2.43.0

