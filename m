Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6019230B50F
	for <spacemit@lists.linux.dev>; Thu, 15 Jan 2026 06:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459929; cv=none; b=o3cEjqNTzkBE0Q2zMDbHXuU5mBdPs6RFKwebLy5osoK640V0voH1cizF01p8NCo5prrfgrDY9xxh9ujiNTVtAKRAN/j6BYVZc060DTaswf1fHay+h8tW5H2bqCT5cnY6pz0WY+t4fN2nbZh/wcmdHqUGNxj4kwau8h/0HlD3Z5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459929; c=relaxed/simple;
	bh=yLe3j6lF/FJQaVVvG1o4P48aeD+Y8yDZi7XfHMnNJsU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KqAhsNVcXFbGBZZCpuUyJ2AIFF+JHngEyrTkdpKdkuee5Y/4bwWfqoR6PsFFuGnb2IicsVxjuP11nnR6KpQv1dWz4GAecZG2Iv8W6aUfXahDYdbuhFQvbYadO9kTv7F1xDS+1V3yOWQR9ZU/eJaTLlvbAlr7vgowiU55I7uBOn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=z+9UfFpb; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="z+9UfFpb"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a0bae9aca3so4214095ad.3
        for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 22:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768459924; x=1769064724; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WD5EX5DuQsu6pRaXLnKPwypf1PUd+lvHZxR7rQ8Qqm4=;
        b=z+9UfFpbtmijQKYJ0CjEk945imSz4xIn20kMpl3en08zI7Zvl0xNPaNEbQ1lasDEsA
         bPcctA468pBJXNJYvpsHsrE8aJA5wG/sxr0R0eFpDVVnPq7eShplLHejdCt9dTivA3qJ
         ZLp0cYY/Yw0RZClTmzQVNYuHiL/oCMybLgZHYQJi+fU32pHAWERUvczvj7q/lgpIlFsJ
         ZUfxxNV7N+SIOmIxR5zbhleRoHvKoIgw9lkQChRCcIIVZCsFreU1jpD9HjA8PFVlW/5u
         TJ7HHdQPAxKoHptb6i2uTp5ZA/Rrvrao3VOMDS3Z38/rVvTKyJi7haMI4mIemwskBd4a
         mqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459924; x=1769064724;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WD5EX5DuQsu6pRaXLnKPwypf1PUd+lvHZxR7rQ8Qqm4=;
        b=vcoLXBFuO5ssxV8ctmyUJ25gBdcUmbM+sOBpx2usGNSuVHBti9mx4BuvKiM6xUiwpR
         w4Eoy0IyBOTeYOUPkB0Xv1FEQnkah4tDq15rIxqxQV+/2/cnYjPA7WmZE0aXleHI7ySk
         Z2na6wrE0QGVHZ8/8GQ1tIqpY3LmNVEwZq4jqOi2MDWJ9exCBecXNPnKbACvJGX8M/+9
         PCODMLgIzYE2kp5NwGjIZXuagCL/fGeWvkysCARapReuM8HK5KMQOscrvZjETGFALEWf
         ndOdqhI1Yht0QpUY6yuImEjJRIy+Vdid7rvBDBx40I0m8PMYC5SgjoLDTjZolVG8aTbx
         f5Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVxg3M0kzd9x7qbs5hpaa4S9tAZEJcIyg0K4HDcQ7eI+QqOheH10NPYgkXoUjRECvaZqMtLNl6Pqg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzdzkxe/nOob4sVn0BypSrFX8ONyX8mUgEId7wSC2Q735qYaT0Y
	Kl/boD5+jMoLrP/sGm/iuBfnIgT77ARihau5B/qb8KIC/uk3T6jeiGO0h247kR+niKQ=
X-Gm-Gg: AY/fxX6Twu/BfU+cljuvZqxE4x21/alZjtD179Cp8OKMDzGDEcw+E+KcJhXLQDrOuS1
	0Zj1nVgojyIr3I6XRhuxKRjvi0CWPjHLS2qMFAb0OpZW9lx2eyFWJE5B35Ph6Hs3tD+VNb03dVl
	Hvh5jxx9AyC8jqHgAeCQDwW+YTNvoY85emayky/gSQ8HushoYpdHTw1agWOxy/q96IMDlzlq7rr
	JJCe45ykwaHJFtjGtI3Aempc5S/ULJy4jbjI52Ad2jMJsj8K1XLC3Wgo1bL33usBUjqjoNcnm3M
	sYsaL7poqKpG/RiDnyUXhC35QiavtqHcwqHeq69g3pML3JsXVwBJMvAX3MR2APUkQq6rMf6FABs
	6NrOerBUnDwtToNm/IluvIBASITslZR5QRFNyAkramCgQXfULlohyZ7IKaDyJt1MEkpvhsBmIM7
	bMPHwHr5QjLMYujsKiyahE6yNCSnZsO/oat82PzAtc7XC9gHYKm+gwUu7GeJJCCmNN
X-Received: by 2002:a17:902:e54e:b0:267:a5df:9b07 with SMTP id d9443c01a7336-2a599da5160mr56673845ad.12.1768459923615;
        Wed, 14 Jan 2026 22:52:03 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e7a3c6fdsm235081015ad.15.2026.01.14.22.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:52:03 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v5 0/7] riscv: spacemit: Add SpacemiT K3 SoC and K3
 Pico-ITX board
Date: Thu, 15 Jan 2026 14:51:39 +0800
Message-Id: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHuOaGkC/23QQWrDMBAF0KsErasympGNlVXvUbpQpFEjSuxUU
 k1KyN07SVqIi5d/xPuCf1aVS+aqtpuzKjznmqdRQve0UWHvx3fWOUpWCNgZNL3+IL3zNQcdmw7
 RdRagN25wSsSxcMqnW9vrm+R9rm0q37fy2Vyv6z2z0aA9ROz64GJw+FJyDbX58hymg7pWzfjAE
 ZcchZNPlChESINf4fTHezAwLDkJ5+gc72wgH2mF2wduYMmt8GgdJvIEKf3//XIfpvDnl6zb7us
 o4azl/ZDbdjPyqenfcivi8gPXxYELlwEAAA==
X-Change-ID: 20251216-k3-basic-dt-cd9540061989
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3

This series introduces basic support for the SpacemiT K3 SoC and the
K3 Pico-ITX evaluation board.

In v5, patches 6-9 (dt-bindings) have been dropped as they were accepted
by Conor and applied to riscv-dt-for-next.

The series has been rebased on linux-next tag: next-20260114.

The SpacemiT K3 is an SoC featuring 8 SpacemiT X100 RISC-V cores.
The X100 is a 4-issue, out-of-order core compliant with the RVA23
profile, targeting high-performance scenarios. [1]

The K3 Pico-ITX is an evaluation board built around the K3 SoC.

From an RVA23 profile compliance perspective, the X100 supports all
mandatory extensions required by RVA23U64 and RVA23S64.

Link: https://www.spacemit.com/en/spacemit-x100-core/ [1]

Changes in v5:
- Patch 1:
   Add Acked-by from Paul.
- Patch 5:
   Add Reviewed-by from Yixun, add Acked-by from Conor.
- Patch 6 (Patch 10 in v4):
   Update the copyright year to 2026.
   Update the commit message.
   Set M-mode maplic and mimsic status to "reserved".
   In maplic node, use riscv,delegation to match kernel binding. OpenSBI
    accepts both delegate and delgation, but the binding documents only
    riscv,delegation.
- Patch 7 (Patch 11 in v4):
   Update the commit message subject line.
   Remove the unused aliases.
   Update the copyright year to 2026.

- Link to v4: https://lore.kernel.org/r/20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com

Changes in v4:
- Patch 5:
   Adjust maintainers list in alphabetic order.
   Declare spacemit,k3-pico-itx as an enum, which could save future
    code change when adding new boards.
- Patch 10:
   Fix missing blank space after comma in simsic compatible.
   Add m-mode imsic and aplic nodes, per suggestion received from Samuel
    Holland.
   Adjust node properties order in nodes simsic, saplic, mimsic, maplic to
    follow the DTS coding style.

- Link to v3: https://lore.kernel.org/r/20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com

Other Changes in v3 include:
- Patch 1:
   Acked-by: Krzysztof Kozlowski
- Patch 4:
   Acked-by: Krzysztof Kozlowski
- Dropped Patch 5 "dt-bindings: serial: 8250: add SpacemiT K3 UART compatible"
   as it has been applied to tty-next.

- Link to v2: https://lore.kernel.org/r/20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com

Changes in v2:
- Patch 1:
   Fixed alphanumeric sorting order of compatible strings (swapped x100 and
     x60) as per Krzysztof's feedback.
   Update commit message with more information about X100 featurs per
     Yixun's feedback.
- Patch 4:
   Fixed the order to keep things alphabetically.
- Patch 6:
   Use "one blank space" between name and email address.
- Patch 7 ~ 11:
   New patches. Add description of RVA23 mandatory extensions into riscv
    binding YAML file.
- Patch 12 (Patch 7 in v1):
   Removed aliases node.
   Updated 'riscv,isa-extensions' with new extension strings available
- Patch 13 (Patch 8 in v1):
   Updated the memory address to the hardware truth.
   Added aliases node in board dts.
- Patch 1,2,3,5: Add Reviewed-by and Acked-by collected.

Link to v1: https://lore.kernel.org/r/20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (7):
      dt-bindings: riscv: add SpacemiT X100 CPU compatible
      dt-bindings: timer: add SpacemiT K3 CLINT
      dt-bindings: interrupt-controller: add SpacemiT K3 APLIC
      dt-bindings: interrupt-controller: add SpacemiT K3 IMSIC
      dt-bindings: riscv: spacemit: add K3 and Pico-ITX board bindings
      riscv: dts: spacemit: add initial support for K3 SoC
      riscv: dts: spacemit: add K3 Pico-ITX board support

 .../bindings/interrupt-controller/riscv,aplic.yaml |   1 +
 .../interrupt-controller/riscv,imsics.yaml         |   1 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/spacemit.yaml        |   5 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |  29 +
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 590 +++++++++++++++++++++
 8 files changed, 629 insertions(+)
---
base-commit: 78ffa9bb137071c00eec2d4afc247ef92d5c0b90
change-id: 20251216-k3-basic-dt-cd9540061989

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

