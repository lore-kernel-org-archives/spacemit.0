Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78368154425
	for <spacemit@lists.linux.dev>; Mon,  5 Oct 2026 00:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791161707; cv=none; b=RUHFtNzGrUkKr/hNIGbX91l58Vfrgs76cN2APNOppu7QUIjIkvZ4SQ0tRPvBQmEoVz37v4fk4N2BNKNJvxwHAnoHdVTjbVkxfDKv3g5X/hYgU5qYbkU9ZjHN8kmWj0x1qQxWjPjZYqSBZTDGS5QnXFv9Kx5Q7LgVZCGJWkFaVYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791161707; c=relaxed/simple;
	bh=Z6URXM4w3F4xZnixWEt6Ds+rM7nLoR3++lFHAFRkjb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q6PZphPoRnaUoE0mMVaZzJClTZ7ssncBYYpL/B55RYAabiGrMKiYgaOTg78ZvwFWXTKixTvfWUD8KQCFgtanR+FiN+/qWvm6ldFsCGlvp82nPpLjh1FMWOmnpUXVdPtvk4T7f/HL680BVhiLIkIaZcCJbcYXhbSGjOW2JAmMXig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=nZk6/9Zk; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="nZk6/9Zk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1791161685;
	bh=RjWIPnMo0WuuORQ8XVbFkHZMWG+22lnu2Y2UOJjDMgQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nZk6/9ZkLpBLRFXyLOX7Hs12bHRtmbM7SB7xvK1LxnNlL3Oaeb3VkhHYIt6NSP8s0
	 pWGC5RCJSBfVqzVqjnw96XgBmZ8ivmWYh7Acx7GdEb2x3B4jaK7RePVMFXZTsUsHY8
	 iFq2OO70VFwfHUB8fF6h9bW9N3+F4HWuwHQMn8hTVkn/M6yr6A6d2UXHewRCSA6yqd
	 uCY+jsd0IfdoU0umcIc8AqbCp6/nmCFiXCCCBNmC23u9SkfK4DFELMY/5HbkAue/CA
	 tWhj9dMnygmrBmGyLjlPGk8DC6QCQxxElRjasgogKnUt3PlPP72eA2U6bkL+80dSNP
	 QeB0ffLyI7+rg==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 7F21BB2217C7;
	Mon,  5 Oct 2026 02:54:43 +0200 (CEST)
Message-ID: <edc620db-7b9e-4c37-81ba-dead078a02f2@freeshell.de>
Date: Sun, 4 Oct 2026 17:54:41 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] tools: mkimage: add SpacemiT K3 boot image support
To: Junhui Liu <junhui.liu@pigmoral.tech>, u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Simon Glass <sjg@chromium.org>, Daniel Golle <daniel@makrotopia.org>,
 Randolph Sapp <rs@ti.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kory Maincent <kory.maincent@bootlin.com>, Yixun Lan <dlan@kernel.org>,
 Yao Zi <me@ziyao.cc>, spacemit@lists.linux.dev
References: <20260921-spacemit-aihd-v3-0-f660fc85d2a5@pigmoral.tech>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260921-spacemit-aihd-v3-0-f660fc85d2a5@pigmoral.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Junhui,

On 9/21/26 07:54, Junhui Liu wrote:
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
>  doc/board/spacemit/smtimage.rst | 143 +++++++++++++++++++++++++++
>  include/image.h                 |   1 +
>  tools/Makefile                  |   1 +
>  tools/smtimage.c                | 208 ++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 355 insertions(+), 1 deletion(-)
> ---
> base-commit: 211de43d0f954a00a490220c1aac9db298287c40
> change-id: 20260820-spacemit-aihd-05c46aae886e
> 
> Best regards,
> --  
> Junhui Liu <junhui.liu@pigmoral.tech>
> 

Thanks for your work on this, the actionable concerns I have with this
series are about keeping documentation short for being reviewable in
diff output, and revising the suggested SPL image output name to be more
sensible for mainline u-boot. Let's see another version and get this
merged, please.

-E
