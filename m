Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50454C6811
	for <spacemit@lists.linux.dev>; Mon, 21 Sep 2026 16:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009608; cv=pass; b=DEGTX8rsOzkDzqRPEGFc7PwaDRc0egqn45tRHEbG2X02i+FDO9BoNfW5uiHczcNq8GQpePeklxkyi8cKxljiYnfasq2mQucVgGHxdBo2aYrVJowat4Y9E8CWfny1pF23iOTMGBpuJnn1vYTADyUMO1ovPEdBPryHJD+RTmJnQFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009608; c=relaxed/simple;
	bh=GyP7e6oyOH2aH+zrwU/y9MdNW6N2z7lQvCqphiHYx30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmdlG0bJxhrjduUN/NaBJjr7BSUXmzoPAHgo6de19P7KLaykHmgLwAB2pYA4om/+VCPBHd50319khy6FXcVrRjf73lrYxJ0naQSHcoQZzpszT+kr+vixY5bf1WViW+0v0rJOKTCf7gtiBoDfDTwJWZXJqjIP2tGiR8XinjOjy9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=PYKUNjWO; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="PYKUNjWO"
ARC-Seal: i=1; a=rsa-sha256; t=1790009596; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fo0Tcz66tbSBNkfuvBO8vBSZDsE7zkEiJGvOzvJ96Tq8p64fxWgueFweFTu11tyvztBSBe6le8Yz7PR9ECIUFGpbHQFxW8/MbBRjZzFEP0hOHamfEuFZZTxZU/Ttl1haun6y5426pwOUb7PDrZm+m96SSd5GHD3JjNOAzlfIVfE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790009596; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=K+L3SLq90kDfYzcPgGFoIViEEhflyVMvFHya6naqWDw=; 
	b=Wp+XiDUgrMAZIPrUGgW70BOA1vaRfKxp0JEHMUxKOWAQzaRTMKHMJVIUPcyLtgSkNvw6iQHHi15II6Nemfe90QJIuLEOpglLrTDvW013FWuLAMT9IrXgYmjwOBIJiTT4kkZrORFUFLBWbDxqA64HyF70FE4jwg3ZhF+hv+qQ//4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790009596;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=K+L3SLq90kDfYzcPgGFoIViEEhflyVMvFHya6naqWDw=;
	b=PYKUNjWOdqiVv8t8DNJsBQi1XdSCUTrI/a2sdp/bybGeKRkclSa3hYFbUJk1TIq2
	hVgoJXPhd4uCVT4lR6m2QINssh361gLXbGHFh8cJMQ5hgmQspJV8gdOtL3sOg3hQf6l
	KOaLBAj9IXgbmjLr/J682p79LmAY6qAlwHGMfkjI=
Received: by smtp.zohomail.com with SMTPS id 1790009595515668.187319522702;
	Mon, 21 Sep 2026 09:53:15 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:53:08 +0000
From: Yao Zi <me@ziyao.cc>
To: Junhui Liu <junhui.liu@pigmoral.tech>, u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Simon Glass <sjg@chromium.org>,
	Daniel Golle <daniel@makrotopia.org>, Randolph Sapp <rs@ti.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	E Shattow <e@freeshell.de>, Yixun Lan <dlan@kernel.org>,
	Yao Zi <me@ziyao.cc>, spacemit@lists.linux.dev
Subject: Re: [PATCH v3 0/2] tools: mkimage: add SpacemiT K3 boot image support
Message-ID: <arFg9Pii2uosUkrz@pie>
References: <20260921-spacemit-aihd-v3-0-f660fc85d2a5@pigmoral.tech>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-spacemit-aihd-v3-0-f660fc85d2a5@pigmoral.tech>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.848.60
X-ZohoMailClient: External

On Mon, Sep 21, 2026 at 10:54:37PM +0800, Junhui Liu wrote:
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

For the series,

Reviewed-by: Yao Zi <me@ziyao.cc>

Thanks,
Yao Zi
