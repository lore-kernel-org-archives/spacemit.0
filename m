Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0358367B73
	for <spacemit@lists.linux.dev>; Sat, 22 Aug 2026 08:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787389097; cv=pass; b=MqR+hNuomWB9LmsveuaKUs/US0K8brcNQE4Vp7h6qjCcO2tc3lMxa/WZxPtqpbm/FeDkWUEiwXlcG9HlIzhY3oH9IFUG6lpzE/+a+v2k6u6qJY+YhZG9piWssYcpucJkKZPr2jTW0n1pvN4OfYN72UeHcFDpqgs5ILR9h5nKlhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787389097; c=relaxed/simple;
	bh=kvlWf2zySoabQt8RFJImil2B9f9gs0ZgElenWE+H4t4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WfUgUJLA848bR4ikuWmRosUuUE70ypE2KHlua7B10BpigFVfNF8SVP8Ry0oT+KzbW0Y9wejFYXVeUn3Nf2qv94OFfLXQG86rsBEEeStDCIcxZxPIdZ0v9K4a/46DcyPY2P4L7Sr3KXSsPBe2yTI8yZ/GgurFhbQGNPSEkbeTOPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=i8CX1uaI; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="i8CX1uaI"
ARC-Seal: i=1; a=rsa-sha256; t=1787389083; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mji1j0NZhDXWu+xwYVd3cCzndxc6ooo4ngjINSWdWsY7pl3LYS/Cvw7FHk4j23t6TqN6KJxUY92uK/92kUMbP2Ias9qtl5XK5o30phXu2DRx+KnTDGLeujO3qnQvPEYd8e4RHzHsbXYBUpuG9FC9cWGk71BIpPXoE03zvx+OXCs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787389083; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EpVsutJ7yw0MJ2DK7FKUnEADtl4Oz0oQwe86Yo8xAhg=; 
	b=M0QH/kS8kbdBUa+NPorrEzUdQJpVTkpqcefH7ZdmdnSCYr78+iJZLG8CeKjPbzHBv/xXfK5+89g8RKeaZO+IqXDQuIyOP8yYfPYPbL1TNMJeTXOfEkRW8eIygaTfOeg4wkXy1TZwlevwKGm0hI6Ee3wADmnwnhnliBivkQ+iSuM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787389083;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=EpVsutJ7yw0MJ2DK7FKUnEADtl4Oz0oQwe86Yo8xAhg=;
	b=i8CX1uaIdednr6D8ptvyZgt93Ru4DrKZPN6R1d+eoASwQ2sEK07O7ZXltgYDIn0Q
	s2I3/dhurpHayop51H0k71dkCbF8fMCF6bGmg4/qtGxKp3NL628dq9HOSGHgKOazgyU
	JlXEk6y5elrocpGqwO+TAOTGl9Shu/xsTBrz98uM=
Received: by mx.zohomail.com with SMTPS id 1787389081734440.4493253970717;
	Sat, 22 Aug 2026 01:58:01 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH 0/2] tools: mkimage: add SpacemiT K3 AIHD image support
Date: Sat, 22 Aug 2026 16:56:46 +0800
Message-Id: <20260822-spacemit-aihd-v1-0-bf4c41993891@pigmoral.tech>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrA3EoCH0KuJiGn91BK1kbCmId
 ze2y2/x3kGKJFB6FAclfETltWZUZUFx4nWEkT6bnHXeBmeNbhyxyG5Ypt7YJtaeGSF4UG62hEG
 +v1/b/a3v54y43xM6zwtyW7iCcQAAAA==
X-Change-ID: 20260820-spacemit-aihd-05c46aae886e
To: u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>, Junhui Liu <junhui.liu@pigmoral.tech>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Simon Glass <sjg@chromium.org>, 
 Daniel Golle <daniel@makrotopia.org>, Randolph Sapp <rs@ti.com>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Kory Maincent <kory.maincent@bootlin.com>, 
 Guodong Xu <guodong.xu@oss.qualcomm.com>, Yixun Lan <dlan@kernel.org>, 
 spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2501;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=kvlWf2zySoabQt8RFJImil2B9f9gs0ZgElenWE+H4t4=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLI6UxpnbSw4cO9+wY4Pman539vmZ7vVBT8U/qpXrDBvq
 2pYWdSfjlIWBjEuBlkxRRYuf/F/1jo8344ItN6HmcPKBDKEgYtTACZyo42R4c21/cd3MHyZc7/3
 ZlrU5RsbLv1VWe92M9jrxirxGVN+Frxg+MVsmHGg+8THesP7LDHLzunfO7TkTbSU6KyzsjuPn42
 3KuUFAA==
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

The SpacemiT BootROM loads a first-stage bootloader from storage or over
USB in MaskROM mode. Vendor firmware packages this bootloader as FSBL.bin.
Its headers use the magic "AIHD".

This series documents the AIHD image format and adds the "aihdimage"
mkimage type for the CRC32-protected K3 variant used in non-secure boot
mode. It provides the FSBL packaging needed for future K3 SPL support.
Select K3 with "-n k3" when creating an image.

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
  $ ./tools/mkimage -T aihdimage -n k3 -d k3-uart.bin k3-uart-aihd.bin

Hold the FDL button, power on the board to enter MaskROM, then run
fastboot on host:

  $ fastboot stage k3-uart-aihd.bin
  $ fastboot continue

---
Junhui Liu (2):
      tools: mkimage: add SpacemiT K3 AIHD image support
      doc: board: spacemit: document the AIHD image format

 boot/image.c                 |   1 +
 doc/board/spacemit/aihd.rst  | 145 +++++++++++++++++++++++++++++++
 doc/board/spacemit/index.rst |   2 +-
 include/image.h              |   1 +
 tools/Makefile               |   3 +-
 tools/aihdimage.c            | 202 +++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 352 insertions(+), 2 deletions(-)
---
base-commit: 6073c36b2c8d39afe3ecc789b281667a3ddebc70
change-id: 20260820-spacemit-aihd-05c46aae886e

Best regards,
--  
Junhui Liu <junhui.liu@pigmoral.tech>

