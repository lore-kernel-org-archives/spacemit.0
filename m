Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EF83128DF
	for <spacemit@lists.linux.dev>; Fri,  9 Oct 2026 16:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563503; cv=pass; b=EhQ/c1UXkzIVaN7yhI67yTO7Ad6mXeKYCYZUoqiJKlSuaCUnaM3/wYC79sWGe73KSazg+oO7uAyYoxGdmz+WimVOc2XZxKtAWGK9eJbs8aNbIxcIXWu3OHrCQ4HuBItUO150R2NAepc8wGBM2+kWdcU2FQmDZ6c3aOU0FqDH4bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563503; c=relaxed/simple;
	bh=Dc3kh8O3/9scyoefyDoS8KF70UKjjjEbXxGRkDUU99g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gdMUNwDHpseRPHNQDsOAEEhTekVaXdvHmSFpIAe4s4FMYjdx6MzbPB1SDsdz6osLR4Md1/3K/mq6X+Rgn8SKlCpvtfZwHaZTU5pjhT1sFdQfe6znHfBQ4M2R8lO1IpGNTlcG2Zzqe1HIqkVbWf5/oPPftdCVR+1yc+op8FlgGQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=kzTDvnFS; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="kzTDvnFS"
ARC-Seal: i=1; a=rsa-sha256; t=1791563494; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=blI/M9VYn3hwXWzrIgp47dy6DSjtajhbLZouj5evtVPxd3y9l3vdZMSolt9vAyc56fUS8ZKWFpubYPK8/GawVUpcPb20/EA7JICdEIUyaqy5b+np0fODPas7H94rHNPltVNlYLNMbs6cAfcHbMtYK2Dg8duZb/pwNDJXKri+0o8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791563494; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jPg2AhsUuXGeAL2wAk56bcng0ZFl4sCfdPT41d9ques=; 
	b=co2hkMGCSmAOk2TJ4f8h3y/OLiOJJIj0LcQOeTOksZ8f5LEDyX9itAMsslL+9youuahOAvHpGUAQ2i4YmHVrTheN5EheR/NGXWZATauUiYrqWMSf3OXZRIJxuyyYNUOyybYE4LPwb86YbXt+qupFPJgnHBK9b2hsWNciydQVtqQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791563494;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=jPg2AhsUuXGeAL2wAk56bcng0ZFl4sCfdPT41d9ques=;
	b=kzTDvnFSGYbQZrcTksNugMK04rP69oIJ3GjGwMkMg4hwblpst9rz8qBgGL8Dm2Vn
	kwz7q+jj/xc7pqwUEuGYpLt58HrnWM6mld4SvDUio9bahi3zezh4fluOSCebacISxiM
	Dm1KldhCUoxg4/jpD4WhIBCajS/Ejb7/fEY6ur1c=
Received: by smtp.zohomail.com with SMTPS id 1791563491939418.3864654210653;
	Fri, 9 Oct 2026 09:31:31 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v4 0/2] tools: mkimage: add SpacemiT K3 boot image support
Date: Sat, 10 Oct 2026 00:31:06 +0800
Message-Id: <20261010-spacemit-aihd-v4-0-e7152ae4d71a@pigmoral.tech>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NwYrCMBDG8VeRnDeSTNuYePI9xEOcTuzI2pakF
 kX67qbKslI8/uGb3zxEosiUxHb1EJFGTty1OcqflcDGtyeSXOcWoMAoC0qm3iNdeJCem1qqCkv
 jPVlrSOSbPlLg28vbH96drscz4TAj86LhNHTx/no46nn3Z8PCHrVU8hhKLLVzhXV61/Pp0kX/u
 x4IGzH7I/wLTrmlAFnYWEXOYoBA+E0oPgTQS6HIQjBGBbRVDb5aCtM0PQECn9gXRAEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3230;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=Dc3kh8O3/9scyoefyDoS8KF70UKjjjEbXxGRkDUU99g=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLJOil2UffecM+3Q8wWdu/o83EMV391au+6X1xm7O7KdS
 +w8JdKnd5SyMIhxMciKKbJw+Yv/s9bh+XZEoPU+zBxWJpAhDFycAjCRaUqMDJ8sAjjksyemGn/w
 9TseOceXRVe6wfD4pAwrgczw0B3yixkZlmxk67wSvKHTTi/m17vz8iFtO1UZZrUVVHDs0N02y2s
 7KwA=
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
Changes in v4:
- Revise the documentation wording and layout
- Collect tags
- Link to v3: https://patch.msgid.link/20260921-spacemit-aihd-v3-0-f660fc85d2a5@pigmoral.tech

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
 doc/board/spacemit/smtimage.rst | 144 ++++++++++++++++++++++++++++
 include/image.h                 |   1 +
 tools/Makefile                  |   1 +
 tools/smtimage.c                | 208 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 356 insertions(+), 1 deletion(-)
---
base-commit: 0a55b098d6f5f6bafa84fc2f18b433dd167bf729
change-id: 20260820-spacemit-aihd-05c46aae886e

Best regards,
--  
Junhui Liu <junhui.liu@pigmoral.tech>

