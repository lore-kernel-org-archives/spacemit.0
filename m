Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5933C271443
	for <spacemit@lists.linux.dev>; Wed,  9 Sep 2026 15:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969140; cv=pass; b=oq6LKPE/OTeYIKbPZA35B3ZWxZnkoCGOkTQIliTQZ3U3fpFzJAvqu8kzuoivLMHpC7KaplW8OBqOdjRjwMAYoRYff+5WNX47OgXGisNQayYpDwvY+XoZWYNQKmPVkEv6hRvGtHdcluoo7bcpbkwg7XcnZGQ9labOyG6syeyF4DY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969140; c=relaxed/simple;
	bh=yPBLvKfNkdscClw6kvY4qBBn2L3O/X+7KkIqhI0Y5Nc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XshJYi3jCaI9V+wFbaijD2K33InnJQi6Gjpnh5Ey/oNJdLDoUf05J5994A5YN942hzzKlrcoPv8ICPYX89ZtFGm8oxYRtOUTGxUgjLB5eQnExSV12n72JtMy1LXZfIBqTxmJnOqCEx3pD7i4mDt2JGJhhYK5WG8neeCmDlC2xxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=MdVwZdmj; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="MdVwZdmj"
ARC-Seal: i=1; a=rsa-sha256; t=1788969126; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PqrMT/c3JbQQE0Omryw7vk4c1uHG4BMsb3vPexJndQdOaO3XF2JPkC6aNXMRyU9KXcxLjXLGVXwmdJbd/RGbEL8u3C0Ae4dU9Sy63MRZhPci8AQhiHHYKlMPE88gOb152y7QzqlVjDbgKSoS1G4Z3imNuJlQ7hDdswStOKiS/1w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788969126; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JP+N5lCYfyP8jJB+cDu/whBsQIsnR9yEX6s5RN6AVDA=; 
	b=T1JDUoE1cAbI3+UNPUUZ3ZzY2RgVbF9eZW8r8Zw3KiprO+SxjBMoG5qSZ8tgRUn1akV7hxFf+WCXsFnPzMuE3LOsUK7F7i0Bx4U+pItHmp+EQDcRxf6fHInNn2ZzcVWayn2yzG7zkVYnfQhf4UWF6a0g3PLAeKGincD2J2OP3sM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788969126;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=JP+N5lCYfyP8jJB+cDu/whBsQIsnR9yEX6s5RN6AVDA=;
	b=MdVwZdmjB03UZM1Wo00qxlCFqdwdSMtrrKa7yfEiY+xPdyXauF+c6k0b4KJsRfvJ
	cD+kdX7uWUj8bh6AjyNAWtnuZquAkS0YTsmeOflIV1HCFiHap1kt/JuM1J4meqBE65/
	rRWMa6/jTdLRyaBN2YK0XeBV4btcxquTTvDw1kD0=
Received: by mx.zohomail.com with SMTPS id 1788969124329972.2090186596714;
	Wed, 9 Sep 2026 08:52:04 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v2 0/2] tools: mkimage: add SpacemiT K3 boot image support
Date: Wed, 09 Sep 2026 23:51:07 +0800
Message-Id: <20260909-spacemit-aihd-v2-0-780e98cf2fec@pigmoral.tech>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NwQ6CMBAFf4Xs2Zq2VlI8+R+GQykLXSOUtLXRE
 P5dwHjxOMm8eTNEDIQRLsUMATNF8uMK8lCAdWbskVG7MkguS64lZ3EyFgdKzJBrGT9bVRqDWpc
 I62YK2NFr793qL8dnc0ebtshmOIrJh/d+mMXm/dryr50F46zplFWiqk66EteJ+sEH8zgmtA7qZ
 Vk+Jq+9FsAAAAA=
X-Change-ID: 20260820-spacemit-aihd-05c46aae886e
To: u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Simon Glass <sjg@chromium.org>, 
 Daniel Golle <daniel@makrotopia.org>, Randolph Sapp <rs@ti.com>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Kory Maincent <kory.maincent@bootlin.com>, E Shattow <e@freeshell.de>, 
 Yixun Lan <dlan@kernel.org>, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2703;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=yPBLvKfNkdscClw6kvY4qBBn2L3O/X+7KkIqhI0Y5Nc=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIWNkwJOPj5qafKdpcw+RXmqe2H4ziXRUxgvdz+fU58e
 ZnV+vOnO0pZGMS4GGTFFFm4/MX/WevwfDsi0HofZg4rE8gQBi5OAZiI+lNGhif2Hz54Hpn0uzvC
 6Pjm3cov2stOz5jTLFjAtchm9qK6vxoM/2s+Xu7S3nEueN0jv40L6jjWeaTvuiqwRtHZW39RzW+
 li8wA
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
 doc/board/spacemit/smtimage.rst | 143 ++++++++++++++++++++++++++++
 include/image.h                 |   1 +
 tools/Makefile                  |   1 +
 tools/smtimage.c                | 202 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 349 insertions(+), 1 deletion(-)
---
base-commit: 6073c36b2c8d39afe3ecc789b281667a3ddebc70
change-id: 20260820-spacemit-aihd-05c46aae886e

Best regards,
--  
Junhui Liu <junhui.liu@pigmoral.tech>

