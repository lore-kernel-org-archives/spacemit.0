Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2B434F483
	for <spacemit@lists.linux.dev>; Mon, 31 Aug 2026 06:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788157001; cv=none; b=U0PQEvz+uh0CjzTAEbaIs38g4GR8gQKnJsn/E4dwTHcqE/2Pq3IGmHwolz7xqYx7+X4Xj0/FKSOce1fSNewHLm88C19l8OB+V46GC4ektLcgG45VsoLjZerI39BLNRsmubhHDW10GnGCPs5gFOXOIrxSeAeGewuxYmQrxk9bdZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788157001; c=relaxed/simple;
	bh=6kKsaSXfI/3wS2Gi+7azCuU5gJ9s4kqBHMix5/PVsUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j32x1IoDXUuTpltT1m8UE0iu8YUlgnAjRhA3tw+baOir15BYoht521QvJDrp3P+SG11EtlQHpsyo1Nr8vfght1D2UAKIiRIv5Lf4BoLa914afTUNcFI5Zg/BV3kQDgDDNUuJWss+TQp1xbiBdzaa//6J3Fa9i3Tukb4X9QyOmDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=TalHJXmE; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="TalHJXmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1788156608;
	bh=uIBeyMj5kkTAI0cycERcA6YRp2C7r18Lgx63KYwBAes=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TalHJXmE2+YFa6ULKFa0jwtN51XkKMsu3aoY/Bp+iI8XkfDQRFas8sL0fwUG7/VPC
	 IsZFK9GzBFSmYFyjZTZe9Vvbo+epPvL067GnaOZey3EWAX2awN2Mvj5XEKeq1slUxf
	 7IVjsdzTZjHEsDxPLR1UkGine4zsks/IAQM2HW403F1p4ii/c8F55qBanJO8LLSDOV
	 rotYfdNMAUcPhS2i5PTvMblukNzA4E5cg3wqvVROIRud1o2+hnxIUl6Q8Fzt8z3die
	 yZODahKoyLfeeno6dOH7kTQg8E1SKgT8igyZICHqOGztbX6YL7IEaVcuUFBkKb7SUR
	 ZCgctMKbMJVZw==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 4C680B22028C;
	Mon, 31 Aug 2026 08:10:06 +0200 (CEST)
Message-ID: <6565faeb-12cb-49af-ba4c-4fbc66f64eac@freeshell.de>
Date: Sun, 30 Aug 2026 23:09:50 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] tools: mkimage: add SpacemiT K3 AIHD image support
To: Junhui Liu <junhui.liu@pigmoral.tech>, u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Simon Glass <sjg@chromium.org>, Daniel Golle <daniel@makrotopia.org>,
 Randolph Sapp <rs@ti.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Guodong Xu <guodong.xu@oss.qualcomm.com>, Yixun Lan <dlan@kernel.org>,
 spacemit@lists.linux.dev
References: <20260822-spacemit-aihd-v1-0-bf4c41993891@pigmoral.tech>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260822-spacemit-aihd-v1-0-bf4c41993891@pigmoral.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Junhui,

On 8/22/26 01:56, Junhui Liu wrote:
> The SpacemiT BootROM loads a first-stage bootloader from storage or over
> USB in MaskROM mode. Vendor firmware packages this bootloader as FSBL.bin.
> Its headers use the magic "AIHD".
> 
> This series documents the AIHD image format and adds the "aihdimage"
> mkimage type for the CRC32-protected K3 variant used in non-secure boot
> mode. It provides the FSBL packaging needed for future K3 SPL support.
> Select K3 with "-n k3" when creating an image.
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
>   $ ./tools/mkimage -T aihdimage -n k3 -d k3-uart.bin k3-uart-aihd.bin
> 
> Hold the FDL button, power on the board to enter MaskROM, then run
> fastboot on host:
> 
>   $ fastboot stage k3-uart-aihd.bin
>   $ fastboot continue
> 
> ---
> Junhui Liu (2):
>       tools: mkimage: add SpacemiT K3 AIHD image support
>       doc: board: spacemit: document the AIHD image format
> 
>  boot/image.c                 |   1 +
>  doc/board/spacemit/aihd.rst  | 145 +++++++++++++++++++++++++++++++
>  doc/board/spacemit/index.rst |   2 +-
>  include/image.h              |   1 +
>  tools/Makefile               |   3 +-
>  tools/aihdimage.c            | 202 +++++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 352 insertions(+), 2 deletions(-)
> ---
> base-commit: 6073c36b2c8d39afe3ecc789b281667a3ddebc70
> change-id: 20260820-spacemit-aihd-05c46aae886e
> 
> Best regards,
> --  
> Junhui Liu <junhui.liu@pigmoral.tech>
> 

I confirm this output as described with Sipeed K3 Pico-ITX and Debian 13
Trixie host build OS

For the series,

Tested-by: E Shattow <e@freeshell.de>
