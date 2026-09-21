Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE214AB1C7
	for <spacemit@lists.linux.dev>; Mon, 21 Sep 2026 14:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002533; cv=pass; b=D0qPf8L40zEgIcGNYavx93FvpMcvchjs1/L6SizYCx48dk0FW2bcrQ4Y/xZW0m/gXaS1LmXCsiyBm8bfGiFDZ890VgIuTY9Qz3rlbjwHRfZPWVfKqlsjZlkQCFTTNQlnfAh+QMGsL6bnwzij3VxD+ExY30T2G5DxbrQMhhDV8KE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002533; c=relaxed/simple;
	bh=5srazcCwskpX5gAdXOFQHyj95JcNVsf++4+t7CBF8dE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ktPUxZ+pNLNYtJWftBCIT/7qWceCLUGZXrkYZBVDafvbQIN9XyzHEFhFQmyA8Hr0CFy7msFHra1PU/IiwQgo2M8Cf6tv0GsYNZVDdh1hzNEESRug2J51jMdtoOlnZKxOFSbVSmy5U+K/KDDXZjhd494suq7QXycAtemKF/W5hZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=cbHi7OtD; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="cbHi7OtD"
ARC-Seal: i=1; a=rsa-sha256; t=1790002512; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=StCHcE57Or1z638D1lkpKYxLc1iIjO9aGmncItBQu7WAFS765RXYcmngmnC8JXmZDewvFkZbyeFm11gsS46W+i9vmWOKXuvJMI8ONadlCXKww7JnBVCoYSoZhqaFbVuDQMC4rDHOn0t0fuu+P0/r0B5S3vzkfX9ChkHNdn4Fan8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790002512; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6dUCksfe35U2AM8kOrwiaY5uc1/51X6bL0JK+OitqVQ=; 
	b=E7Po0MvZihydJKyv7EdPZ6F2nsYY1NLAfEQfj6kBBs4tDyi0vjeafyB6PbFgEY3AnVKy2gI0e0KfyDCcCwUSG4x+fZVeBWMmUOfhU1dCitiAqWb2y3Fl9FbjU6Z/64dn+YP7E4g78tI8CxEEnM2C37wSuQGj5RyZ0Q4BW7sDlaI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790002512;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=6dUCksfe35U2AM8kOrwiaY5uc1/51X6bL0JK+OitqVQ=;
	b=cbHi7OtDDIzsrMGrbYUlk9o+JCdWXspLP5bNUscea24TD9AlU/K/PepnYFDP7os/
	9GNyR4Nv5mKbVJrUtEC0qkor6fHLsSx+F3nk8k6hL7ie+Y9QkhymtjbpVxEwJOIiq1c
	lrVLr9TKr/FvUEk2rh1IPyrMfrSbCYDP/+B6Yc5E=
Received: by smtp.zohomail.com with SMTPS id 1790002511667864.0374775995165;
	Mon, 21 Sep 2026 07:55:11 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v3 0/2] tools: mkimage: add SpacemiT K3 boot image support
Date: Mon, 21 Sep 2026 22:54:37 +0800
Message-Id: <20260921-spacemit-aihd-v3-0-f660fc85d2a5@pigmoral.tech>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13N0Q6CIBTG8VdxXEcDNIOueo/WBeJRTit1QKzmf
 PfA1tq8/G/f+Z2ZeHAInpyKmTiI6HEcUpS7ghirhx4otqmJYKJmUjDqJ23ggYFqtC1lB1PVWoO
 UNZB0Mzno8LV6l+u3/bO5gQkZyQuLPozuvT6MPO9+ttjYkVNGm64yFVeqlIqfJ+wfo9P3fQBjS
 faj+AuKqa0gknCUDJQ0nejAbIVlWT4544EBAgEAAA==
X-Change-ID: 20260820-spacemit-aihd-05c46aae886e
To: u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Simon Glass <sjg@chromium.org>, 
 Daniel Golle <daniel@makrotopia.org>, Randolph Sapp <rs@ti.com>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Kory Maincent <kory.maincent@bootlin.com>, E Shattow <e@freeshell.de>, 
 Yixun Lan <dlan@kernel.org>, Yao Zi <me@ziyao.cc>, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3053;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=5srazcCwskpX5gAdXOFQHyj95JcNVsf++4+t7CBF8dE=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLI2utpFiiavYq+cxFV6QeCmj6fO0XrvWEUu70Wa55XrM
 j9u2lnYUcrCIMbFICumyMLlL/7PWofn2xGB1vswc1iZQIYwcHEKwES2tzAynJ0/5cmH/O/Oj9aK
 bg25XeHeY/XeI/3Xg/r9lbqbYxn+OjIy/KwwPSq8/4BSyYt5C+X6t344aO31tkznxOkXrzb+Nax
 7xgcA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

The SpacemiT BootROM loads a first-stage bootloader from storage or over
USB in MaskROM mode. Vendor firmware packages this bootloader as FSBL.bin.

This series documents the SpacemiT boot image format and adds the
"smtimage" mkimage type for the CRC32-protected K3 variant used in
non-secure boot mode. It provides the FSBL packaging needed for future
K3 SPL support. Select K3 with "-n k3" when creating an image.

K1 and K3 secure boot use RSA authentication and are not supported yet.

How to test
-----------

Rebuild mkimage, wrap a small UART test payload, and load it through K3
MaskROM fastboot. The payload is linked at 0xc0801000 because the BootROM
places the complete image at 0xc0800000 and enters the payload after the
4 KiB prefix. UART0 should print "Hello SpacemiT K3!" and then loop
indefinitely.

  $ make tools-only_defconfig
  $ make tools-only

  $ cat > k3-uart.S << 'EOF'
  	.equ	UART0_THR, 0xd4017000
	.equ	UART0_LSR, 0xd4017014

	.section	.text
	.global	_start
_start:
	la	s0, str
1:
	lbu	a0, (s0)
	beqz	a0, exit
	call	uart_send
	addi	s0, s0, 1
	j	1b

exit:
	j	exit

uart_send:
	li	t0, UART0_LSR
	lw	t1, (t0)
	andi	t1, t1, 0x20
	beqz	t1, uart_send
	li	t0, UART0_THR
	sw	a0, (t0)
	ret

	.section	.rodata
str:
	.asciz	"Hello SpacemiT K3!\n"
EOF

  $ riscv64-linux-gnu-gcc -nostdlib -fno-builtin -fno-pie -no-pie -static \
    -march=rv64gc -mabi=lp64 -g -Wall -Wl,--build-id=none \
    -Ttext=0xc0801000 -o k3-uart.elf k3-uart.S
  $ riscv64-linux-gnu-objcopy -O binary k3-uart.elf k3-uart.bin
  $ ./tools/mkimage -T smtimage -n k3 -d k3-uart.bin k3-uart-smt.bin

Hold the FDL button, power on the board to enter MaskROM, then run
fastboot on host:

  $ fastboot stage k3-uart-smt.bin
  $ fastboot continue

---
Changes in v3:
- Align the uimage_type table entry with surrounding columns
- Explicitly include the needed headers
- Drop SMT_PAYLOAD_ALIGN macro
- Simplify the NULL check in smtimage_get_variant()
- Fix the title underline length in smtimage.rst
- Link to v2: https://patch.msgid.link/20260909-spacemit-aihd-v2-0-780e98cf2fec@pigmoral.tech

Changes in v2:
- Use "smtimage" for the image type
- Update the documentation and command examples to match
- Link to v1: https://patch.msgid.link/20260822-spacemit-aihd-v1-0-bf4c41993891@pigmoral.tech

---
Junhui Liu (2):
      tools: mkimage: add SpacemiT K3 boot image support
      doc: board: spacemit: document the SpacemiT boot image format

 boot/image.c                    |   1 +
 doc/board/spacemit/index.rst    |   2 +-
 doc/board/spacemit/smtimage.rst | 143 +++++++++++++++++++++++++++
 include/image.h                 |   1 +
 tools/Makefile                  |   1 +
 tools/smtimage.c                | 208 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 355 insertions(+), 1 deletion(-)
---
base-commit: 211de43d0f954a00a490220c1aac9db298287c40
change-id: 20260820-spacemit-aihd-05c46aae886e

Best regards,
--  
Junhui Liu <junhui.liu@pigmoral.tech>

