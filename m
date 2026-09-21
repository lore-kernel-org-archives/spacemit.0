Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4D535C6AA
	for <spacemit@lists.linux.dev>; Mon, 21 Sep 2026 23:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033287; cv=none; b=u1GmpXQ5OVI+95KRvPiVuu0NiHpA1Fk1Zp2Ib8NV/L+XcBNW0SRj3q4yYFmvuoaQ0MhUvD/36ykGugApO6h2T/m6eMNU1PPueQJa7vGBptuHs5hG2crmQE+yxcoSX38RJOVDJVXGOIUEamXI+oW2Xxy2Hm7NVDNKwMUXU2crDgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033287; c=relaxed/simple;
	bh=FtsPyRvHZ6uLoyoH/Oy8AQMJLAWmfGAITlcrwZbmRq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSrr+fsXs8X/kXv0VqmRx6GwIeciAI3o9UTz+eKpSP7gvEWAhURSxBX70MhTwiGqBASgXBhXfG7sFbtP01dSqt+GpMrZijm4uQnCXWkr9cd67M996D58cSaWvDTkGom3SpKGLF/Zrlo4FyqqW81BC9eN59mfeniJep3T01e/jG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVCSdeyH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVCSdeyH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D281F00898;
	Mon, 21 Sep 2026 23:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033277;
	bh=GYdCJGCYLHjDainyCD1+PMu/DeJhUUSAbfN+C9JxI4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JVCSdeyHMF/ngT1AGL5m+a/8mgoFjlYG6BCc+AFfjEKFn8+yzhp0qEN6YBuCNcYLL
	 Ca1xlLuWEnp5Ms3ydZ+BwJD/za30XowBIywavhT+m58tdXfAY8HUlh0RdGnbRTUnEB
	 th/YMmGabPfQINMoEQ/lQvEpbHXK3KjRy5Wu3ANvZQeNQbi1QsEMPDE+qOkOZ9hLVa
	 hccYctv0I6LjwVJqsHBmhLVYOguZC5PEtVnSk8kLqYw9OtoebaQUEULw4Lir4wR9Te
	 /4d74wsC6lH/d+AwWHUViFx7gqTfQbZ1y+qzvyjeoxPgBQdSHz3/KvyxrmFi9uBVsU
	 wzLK2NTWvrY3g==
Date: Mon, 21 Sep 2026 23:27:55 +0000
From: Yixun Lan <dlan@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: u-boot@lists.u-boot-project.org, Tom Rini <trini@konsulko.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Simon Glass <sjg@chromium.org>,
	Daniel Golle <daniel@makrotopia.org>, Randolph Sapp <rs@ti.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	E Shattow <e@freeshell.de>, Yao Zi <me@ziyao.cc>,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 0/2] tools: mkimage: add SpacemiT K3 boot image support
Message-ID: <20260921232755-GKA353745@kernel.org>
References: <20260921-spacemit-aihd-v3-0-f660fc85d2a5@pigmoral.tech>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921-spacemit-aihd-v3-0-f660fc85d2a5@pigmoral.tech>

Hi Junhui,

On 22:54 Mon 21 Sep     , Junhui Liu wrote:
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
Looks good, so with

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
