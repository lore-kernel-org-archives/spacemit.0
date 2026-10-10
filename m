Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E01324B33
	for <spacemit@lists.linux.dev>; Sat, 10 Oct 2026 22:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791670025; cv=none; b=OBbnSF5EoDalzq9JjVPS52YfqwcxTigJ4s3VQiRI/+5wBbHTzREyfPRGaj3NjIBmVC38snQsMvIA5Bre+oca27aUkU0Maby2WBaBtQk+gY5i7ih+ttMnnH8ZajXXVuvmete5rGBh/ZUuT318BHiodQqtOgt80Ihxp9Bqq44Hpis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791670025; c=relaxed/simple;
	bh=7IfMIj1/Ius6rk3mLgFGdDGu8BUbw1pROcfaLJxiAys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GvZ+jvD0Ah+y5GQ7KOB5j9rSym5mpRh4QBZX0ns9qP8FtXPq4cbyMYJEooTHJzVmMHR6tQTfxqqn4qGkG8BfUjrIwltkYIZgrlRoCsNHJfgKI2+MVtLxR7oYdK0MpRD0IiGmHQqVbTUrierunbwi17X/vLfeOzAHZyKycbtnWMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=dQH0lvqo; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="dQH0lvqo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1791669992;
	bh=RUjCQn+C/p7DT5Ev/wV8gDMIVKDGxJu6y57/j+Ia2f4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dQH0lvqo/w5iDWHxJqWrf0PqDN01D5gSMOS9GdHRPsXFs0DlAtqUAV2kmsTFkkeMU
	 0VkDAzTbP4KY1u9HRSwm3gzUFb2kxytuy1Kl7l4JtKpofNciv4ekTJH7+pKAc6WgA/
	 KtCNAZA1QaVl7fRu4khxy2424InOvEsIF4Bb5cJyjtaatBV15zoQDuxIa3+hjB86zw
	 sNuDidhehZwfhdG/PDmco0aEFzp7t/irPwe5XOLyk0lqchYSMAuZowmVbR+doPsEKx
	 Pf18m1K/vEg4X+CF7jAtF4z336AUv7/fZ1ERpMnzduiEnB/RgKrEpZAZ72SzPyqwi1
	 u8nAN/tpwWpoA==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id F32D3B2202B4;
	Sun, 11 Oct 2026 00:06:29 +0200 (CEST)
Message-ID: <c5b06565-355c-4fdc-9f4d-c72977cd5130@freeshell.de>
Date: Sat, 10 Oct 2026 15:06:22 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] tools: mkimage: add SpacemiT K3 boot image support
To: Junhui Liu <junhui.liu@pigmoral.tech>, u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Simon Glass <sjg@chromium.org>, Daniel Golle <daniel@makrotopia.org>,
 Randolph Sapp <rs@ti.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kory Maincent <kory.maincent@bootlin.com>, Yixun Lan <dlan@kernel.org>,
 Yao Zi <me@ziyao.cc>, spacemit@lists.linux.dev
References: <20261010-spacemit-aihd-v4-0-e7152ae4d71a@pigmoral.tech>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261010-spacemit-aihd-v4-0-e7152ae4d71a@pigmoral.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/9/26 09:31, Junhui Liu wrote:
> The SpacemiT BootROM loads a first-stage bootloader from storage or over
> USB in MaskROM mode. Vendor firmware packages this bootloader as FSBL.bin.
> 
> This series documents the SpacemiT boot image format and adds the
> "smtimage" mkimage type for the CRC32-protected K3 variant used in
> non-secure boot mode. It provides the FSBL packaging needed for future
> K3 SPL support. Select K3 with "-n k3" when creating an image.
> 
> K1 and K3 secure boot use RSA authentication and are not supported yet.
> 
> How to test
> -----------
> 
> Rebuild mkimage, wrap a small UART test payload, and load it through K3
> MaskROM fastboot. The payload is linked at 0xc0801000 because the BootROM
> places the complete image at 0xc0800000 and enters the payload after the
> 4 KiB prefix. UART0 should print "Hello SpacemiT K3!" and then loop
> indefinitely.
> 
>   $ make tools-only_defconfig
>   $ make tools-only
> 
>   $ cat > k3-uart.S << 'EOF'
>   	.equ	UART0_THR, 0xd4017000
> 	.equ	UART0_LSR, 0xd4017014
> 
> 	.section	.text
> 	.global	_start
> _start:
> 	la	s0, str
> 1:
> 	lbu	a0, (s0)
> 	beqz	a0, exit
> 	call	uart_send
> 	addi	s0, s0, 1
> 	j	1b
> 
> exit:
> 	j	exit
> 
> uart_send:
> 	li	t0, UART0_LSR
> 	lw	t1, (t0)
> 	andi	t1, t1, 0x20
> 	beqz	t1, uart_send
> 	li	t0, UART0_THR
> 	sw	a0, (t0)
> 	ret
> 
> 	.section	.rodata
> str:
> 	.asciz	"Hello SpacemiT K3!\n"
> EOF
> 
>   $ riscv64-linux-gnu-gcc -nostdlib -fno-builtin -fno-pie -no-pie -static \
>     -march=rv64gc -mabi=lp64 -g -Wall -Wl,--build-id=none \
>     -Ttext=0xc0801000 -o k3-uart.elf k3-uart.S
>   $ riscv64-linux-gnu-objcopy -O binary k3-uart.elf k3-uart.bin
>   $ ./tools/mkimage -T smtimage -n k3 -d k3-uart.bin k3-uart-smt.bin
> 
> Hold the FDL button, power on the board to enter MaskROM, then run
> fastboot on host:
> 
>   $ fastboot stage k3-uart-smt.bin
>   $ fastboot continue
> 
> ---
> Changes in v4:
> - Revise the documentation wording and layout
> - Collect tags
> - Link to v3: https://patch.msgid.link/20260921-spacemit-aihd-v3-0-f660fc85d2a5@pigmoral.tech
> 
> Changes in v3:
> - Align the uimage_type table entry with surrounding columns
> - Explicitly include the needed headers
> - Drop SMT_PAYLOAD_ALIGN macro
> - Simplify the NULL check in smtimage_get_variant()
> - Fix the title underline length in smtimage.rst
> - Link to v2: https://patch.msgid.link/20260909-spacemit-aihd-v2-0-780e98cf2fec@pigmoral.tech
> 
> Changes in v2:
> - Use "smtimage" for the image type
> - Update the documentation and command examples to match
> - Link to v1: https://patch.msgid.link/20260822-spacemit-aihd-v1-0-bf4c41993891@pigmoral.tech
> 
> ---
> Junhui Liu (2):
>       tools: mkimage: add SpacemiT K3 boot image support
>       doc: board: spacemit: document the SpacemiT boot image format
> 
>  boot/image.c                    |   1 +
>  doc/board/spacemit/index.rst    |   2 +-
>  doc/board/spacemit/smtimage.rst | 144 ++++++++++++++++++++++++++++
>  include/image.h                 |   1 +
>  tools/Makefile                  |   1 +
>  tools/smtimage.c                | 208 ++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 356 insertions(+), 1 deletion(-)
> ---
> base-commit: 0a55b098d6f5f6bafa84fc2f18b433dd167bf729
> change-id: 20260820-spacemit-aihd-05c46aae886e
> 
> Best regards,
> --  
> Junhui Liu <junhui.liu@pigmoral.tech>
> 

The documentation (patch v4 2/2) is not what I'd like it to be since not
all changes requested since v3 are being implemented. I suppose this is
a difference of opinion that happens with documentation and I accept
that the most important technical content has been improved to what I
consider acceptable.

Without objection this series (or at least the functional portion patch
1-of-2) should be applied for the 2027.01 merge window.

For the series and with much gratitude to Junhui for their work on this,

Reviewed-by: E Shattow <e@freeshell.de>
