Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B6A2BF016
	for <spacemit@lists.linux.dev>; Thu, 23 Oct 2025 07:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761204589; cv=none; b=rmLLtV2mCs+5GF1oI3CKnGvtYS2F9pROCFm5FC5++qwbzDSyuqOtJZl+gT+lMnYbzn0Ro0sg7YgFH4QM+COYEcDn7c9m4aty2oFELO1Cx/boVUVaOiEe1VnubT3dkB3+iI1qPiwuwKRRc+dTkISeZq32nSpSDYaeFRHiWRidNhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761204589; c=relaxed/simple;
	bh=E+A7wuUeuxnJYXGw4LkRQNLqLgFKjZDXDasWjCBR6aY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M3g7AAFu5RCulT9gveaggHLRYKKCn5S/yXmPDe22feS96em8xYsATe/5jXhvv9zOGCFoCct9ID0SuDbIzidgXPHDmhpJ1NyELGws+rTmUcWJgIfuR2K+ZPyQfMpmDc24d6Z8yZqKvt5d8B4NB04xjeng7D3OZ67f5JjkmpvT/fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=j2Ukcafq; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="j2Ukcafq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761204521;
	bh=H6QZKjoMtGBy7I0nkn1HtRcweYYIKHGgR3xO60z4zbs=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=j2Ukcafq0en9Bl9QbnZVQ3oZMlYKi67/yiMF8piuSgmk/Ml67+HqWDFf7RsZOeHAh
	 cYvg7gOPsc21soUq3SFLKWc1utvbtcfW37IKejUl0jMAZRnDBR4FucDcWfUey+qfsv
	 N2wLH92FL/N0adj1Xz8F+cdnVB8EwxqgGzlsQkCs=
X-QQ-mid: zesmtpgz4t1761204518t0d7a9e4d
X-QQ-Originating-IP: LnN7Cm0YinMJ+d/RpIL+6LqoDO37Lx78zyP6Ulb1mOE=
Received: from = ( [221.4.210.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Oct 2025 15:28:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3060325782525358583
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 23 Oct 2025 15:28:29 +0800
Subject: [PATCH v4 1/2] dt-bindings: riscv: spacemit: add MusePi Pro board
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-k1-musepi-pro-dts-v4-1-01836303e10f@linux.spacemit.com>
References: <20251023-k1-musepi-pro-dts-v4-0-01836303e10f@linux.spacemit.com>
In-Reply-To: <20251023-k1-musepi-pro-dts-v4-0-01836303e10f@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>, 
 Paul Walmsley <pjw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761204512; l=2335;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=E+A7wuUeuxnJYXGw4LkRQNLqLgFKjZDXDasWjCBR6aY=;
 b=+yTZnxXcZwl7axhHvCa3Cmh92C1T5/aAVSBdTsyjuP8AKY0oOhPMc0GPiPzYV1QUD9x/DURd9
 KWieK8hvmfMA5kM75FlXIZmDRsnXbc6T0HvZxBJ93ZIfH3pp0qv8fKi
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M0yfee4XSTXKPO+6mqAUbIb6dbz1ajTzhJnfaqmWdS7XZme1AGjaB/tk
	OhH3AfM3F6M0cfShTO9FZXdc+DO2m4HXpQGawIGG2oJLUBoNmKNeJqkxLYKOgtvxSMLPnko
	VS/WSd6hvgkBm8vl4cVRkcS3ckpU9gPJh4RaKIWK2lSjVKhNhDJouWE3tlnLY+ulCxu2DQF
	49VUkW+d5+GYw/76z7aNBHLy9qK0x7VSZlvf60+NQPIxZAzO11FRFJmJ4Yy6ZuP5F/Ra4KT
	QOx9NpCf5EJYvKy/JQ1VWI3gWVDaFiSqWu54Ti+eUvqt38UgwMHPhqisfPRw6B1NLDgm0Wz
	/Pusby6ZZ2sFqBHrQAiuLtIdOOR6DZ6tSnxPQ8UH4WQLiPXM/PrgY9pLOBI7+iNMpeKj4nU
	jvjQ+NJpDJmKnSYqqVjlzCZhY8UjigTxRRaPhl+oRKBmmRfQiSHDSJzrIwhI+QCdwJZlSNq
	DW4g2pKlURFjfbvNDtvXEJPyMzNJ6tNeAHaeR/fJiBk7MXG4UbTqPQI4AqFs0BGTHv1Kimd
	0GkHasDehu93dRO8Kc5W8feKHoXdmUw/UI+X/rBJtbzk3J5/T/QzFcuDMFVXlCXCGHxUPas
	qEOALn6BaatmCwefpMR2E413G/fh09kIjAP6cfTiM0BhsIXAbPbZ3ycwFvgljsT4Sp6SjeT
	ixiQ/f9UUZ3rSiNvjp8YD2u+9tp1P+G2xQioKvXvmdturgUjfx7rxYBTP2H3G/6XYXwbd8s
	szHyXpFCREskRcynpLfNBfxyqpR15McXkhHbhq4REiLzJVznjH5+d2GZuNgOJbA2mduQhcC
	Dno136L/jAZHS+UyURuzfkDQMJ/BMYzivnWpH0p4PzQQfDBFN2dg2ExMmZQpnjBAsJjdM0K
	qNIXhoG5A5QlmT/3l6Z2D5aTqVn5IBbb5dtb/EkXb+gXcC+4UiL12a9RkcnDOvTogt0oFOo
	RFuAAs74iU50aLgdw1WehQsvFpBcyqv6KwfKvxrDhfmord1smt9YD6VF+nLyEmju94pmlSQ
	cERwkd7+p8cvlRGiO3lImX9EmV8PNR4UnFKEjVEsNM3uhG1WP6mn3VHky1YjIdrfPH5oqyt
	3kYWiVAkCxB1ApSbTv+CXtf7dNDNCI+UUcyYN4VhAqWDF7yD8GhHslKg++c1Kxho6S13B1X
	lx9Qy6I8vDNR9vA+SzfXNsyJ9A==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

Document the compatible string for the MusePi Pro [1]. It is a 1.8-inch
single board computer based on the SpacemiT K1/M1 RISC-V SoC [2].

Here's a refined list of its core features:
  - SoC: SpacemiT M1/K1, 8-core 64-bit RISC-V.
  - Memory: LPDDR4X @ 2400MT/s, available in 8GB & 16GB options.
  - Storage: Onboard eMMC 5.1 (64GB/128GB options), M.2 M-Key for NVMe
             SSD (2230 size), and a microSD slot (UHS-II) for expansion.
  - Display: HDMI 1.4 (1080P@60Hz) and 2-lane MIPI DSI FPC (1080P@60Hz).
  - Connectivity: Onboard Wi-Fi 6 & Bluetooth 5.2, single Gigabit Ethernet
                  port (RJ45).
  - USB: 4x USB 3.0 Type-A (host) and 1x USB 2.0 Type-C (device/OTG).
  - Expansion: Full-size miniPCIe slot and a second M.2 M-Key (2230).
  - GPIO: Standard 40-pin GPIO interface.
  - MIPI: 1x 4-lane MIPI CSI FPC and 2x MIPI DSI FPC interfaces.
  - Clock: Onboard RTC with battery support.

Link: https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v4:
- modify commit message
- Link to v3: https://lore.kernel.org/all/20251017-k1-musepi-pro-dts-v3-1-40b05491699f@linux.spacemit.com/

Changelog in v3:
- nothing
- Link to v2: https://lore.kernel.org/all/20251010-k1-musepi-pro-dts-v2-1-6e1b491f6f3e@linux.spacemit.com/

Changelog in v2:
- modify commit message
- Link to v1: https://lore.kernel.org/all/20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com/
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index c56b62a6299ac24d3cdef7edcdfc407dc62a1846..52fe39296031f21d1c28c4f1ea5ca9fe28caf45a 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - bananapi,bpi-f3
               - milkv,jupiter
+              - spacemit,musepi-pro
               - xunlong,orangepi-rv2
           - const: spacemit,k1
 

-- 
2.51.1

