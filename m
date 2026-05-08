Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0034285CBC
	for <spacemit@lists.linux.dev>; Fri,  8 May 2026 07:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778226231; cv=pass; b=XerEoNsGsJpIpsVvKOQoySdpkr5OCkeipG8I1btXSERzAY4QFxob0leXEcXwu5zJzIawqR0JCMLxAKeWqlCyAw0ChgMISOh4phQWDpYcGMNd+yuDSnO+00bOoyUQkPgn4EvGVijzU+Gi9aJkQRvMeVXnI8L/p8llNIrlMGIjKD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778226231; c=relaxed/simple;
	bh=Iw22eUoGp1D4r0AHZTcHg3b+hM9yukk2NIOisBGH+5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r7EP9QqeDStAZVirXrImfpxwyuRBAXluYim6vOZKNgH+PX/V9sN7/Y+dbTx9rB9TaAZNtWaPMoYVp+2fFW8NbVRFh6xVmtWwjQpRTZeSUmR7BLen5W+/ctz3X0fPF+bX1DVnuMC6Pc0+R4KlwRvnYS5kQAyrgYbHYhb/GCDJ60Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4uYP3NM; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4uYP3NM"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so2690773a12.1
        for <spacemit@lists.linux.dev>; Fri, 08 May 2026 00:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778226227; cv=none;
        d=google.com; s=arc-20240605;
        b=NvX+GiHjUMUoRj7LkT+72e6hn43qojIFlWwYuidTOKqsA5PejHsZnkT5jMMH7dDSjN
         kffpzWm4wat7J/TEvqp6VrOuO0xdGQRVgyct/4F3Elrr3er+kz0Y5hwu4ywb2s7KmQcC
         WbEcPXVz28JURQlWtqwk3pXJeguVI6zxPE/Fr2Xbpk5K7ujsqo4eRceRHRn3qddqO2fw
         c/wbrANu5wxlDyh3rWKXrqchE4G1LNqsAh5xzLTF3BoUTHPXmwjM4SUe0zCl9geUfZ2v
         1fNXWOPKXBPpd6JdsbVVRLSOaB9abINs3ioeFELZtd7sDaRGb4NCki68bkHJ4SOS6XnF
         FlEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RvfEhNCkx1Dd9Nb7GO1+BBfvDbuW9Tnr5NBRBlIyPKU=;
        fh=XaF75WKNzy7GEXsaYc6rZkNk86yvzWTbe46u3hv86Kc=;
        b=XCh8gBkzjtp5scrlTNKczeRUpAjhlc2gR1QGM5jGiVXHNBrl3dz+tLBZhaOsooAkxD
         l1MA5ZGN+4+lkhX3X0EFo+1dCwUJNvBfyvouGevAgfGQsSPYl/klk1RMyozaVRMgI3x9
         XLT+1mToCg4oe9zSXMpOeIpVp56GeyHc+qAkxgRryfMdQWGLzyI25u/McjO+CGC9C1s4
         91GAydvagYkxwplBAlx1pTHEyPFri5PsWz7QRMjfx1RVJUyOeagvlQs+Gq1GizWBOzV6
         3N0R2uoQBo1xYfJ6RNh7dxTVVTXmzpEBJyqPFViBewCKubXWeRwSuY7mRifQQezZCd4Z
         9dbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778226227; x=1778831027; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RvfEhNCkx1Dd9Nb7GO1+BBfvDbuW9Tnr5NBRBlIyPKU=;
        b=d4uYP3NMH581ny1qs0SHk9jFOSt3zN0uTUjlNWqXdNmCWn1OyfZLHnAaJpM4HI/nBM
         gs3vKq3oxYvHPVegcyTy0sRLPvHaY7FPNu1HN9zeFIRhtDrR9QbwvPvbwebDeJ5KtSMj
         dkQHGaQWVg+qs1QSO7Mnza3zoov+b6TW93lUQyYXFzFpAxqZ2coJ+Z6znu2VO8O4fYt+
         uLulpt/vg4u+URr42C8pmyuKAovp0odVm5QOixvuUPIKtfXZfcqoXz2H+1CNuKuGnKIv
         oLvl1J6f7yLSxtyZyATr+N+APyLnhYWgeI23uJFLq4lQKzmJjwFgGGJ8AEFXY20x0/zs
         K/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778226227; x=1778831027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvfEhNCkx1Dd9Nb7GO1+BBfvDbuW9Tnr5NBRBlIyPKU=;
        b=oSFf2hw8wyRtLCmYN0kEdxH7nc1ZAZt98e/s06zKQB4vY0OZnj67Ye8dWGBoolDzf7
         e9aCUIB4b9wtpQDeuhq3yxoLK6ZKVcz7QO5j1BttVDcoUYZcTHwJyQCt62/ucE5H9v7J
         AixWUahg5ZayOSO+rGdcggLTnW8ReFJ7tWh19eISCbv7D+VdT91DLVaDmja5WICr4ahd
         s+KwjYYdUAIVqO74Q7urgvzVoD0fTtkVVQmFJfihk3pOsVShehloz34k65XXnmgOvDdo
         keiya60Y/ucm2LGDMjtYy+92dCb8MZ9r/sySBVlLz4FTLyASj2C4+PcT3TYYkTMp4+UW
         e/XA==
X-Forwarded-Encrypted: i=1; AFNElJ+XLfOeED9aSp8VC1Xhw5VXE8ath+XKZq2jqvJDsQIxDXfawxsyzyh+RjZKLPjTEuIed5kSlOT8Ew==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMurD7ECAO7MM/3LOvFmxMrwMZS9G5MfHerJYBiMrNyVGRHL4k
	7AbGQXZY3RJv0kktUp89jdeuVsH7qPaVNPJOsyzd4YarDXB98/7e89zUJITHyTTvbQvUsq1QoIt
	HP+sK8x4TXp4LAXS/z2MSRKrGImgvOtI=
X-Gm-Gg: Acq92OFP2Jgtj+5Rl51po5WKKWAQlY7ITHce/SK4d1x0Njq/ByBEWU30veXtEAeMJmH
	ZSmfC0EsVyons1Q7ek1ucBj9FRnGmtQGRwluhK8zvUq5a642bSwl/QGGZhYiC3Uaq4V4bfpPEA5
	8Yz0riYc2u+36vvW+7jdwQ6UEThf76C6ts5cJkN+3EbsVFZplktmNPiuF5SiiPppZde/P+P+pJw
	BBGMf4qtdil88FyS/jZV4El0y6pbDx5K3INAG285pcVStLqzBAzmrEB73WHFyQ6V/el2lERUQnA
	HDfu
X-Received: by 2002:a05:6402:3137:b0:67c:4e1b:9134 with SMTP id
 4fb4d7f45d1cf-67d642c320fmr4048316a12.14.1778226226925; Fri, 08 May 2026
 00:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260502051906.8160-1-linux.amoon@gmail.com> <20260502051906.8160-5-linux.amoon@gmail.com>
In-Reply-To: <20260502051906.8160-5-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 8 May 2026 13:13:29 +0530
X-Gm-Features: AVHnY4JlnCRZnKTvTMdYqQJwi8x36a1HcWfn2B5BacrqHqsRYonr5CXEMpLcf3o
Message-ID: <CANAwSgREs-Ai5RxuiD4Ue-8OGGdrhnLSBmSePBrjN3x9=59zrA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: dts: spacemit: k1-bananapi-f3: Add
 vin-supply for PCIe 3.3V regulator
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Cc: Han Gao <gaohan@iscas.ac.cn>, Ze Huang <huang.ze@linux.dev>, 
	Chukun Pan <amadeus@jmu.edu.cn>
Content-Type: text/plain; charset="UTF-8"

Hi All,

On Sat, 2 May 2026 at 10:49, Anand Moon <linux.amoon@gmail.com> wrote:
>
> The PCIe 3.3V fixed regulator node (pcie_vcc_3v3) lacked a parent
> supply reference. Wire it to the 5V system rail (reg_vcc5v0_sys)
> via the vin-supply property to reflect the actual board power tree.
> This ensures correct regulator hierarchy in DTS and allows drivers
> to resolve supply dependencies cleanly during probe.
>
Plese check power tree page 4

USBVBUS->SY8386J UXXX -> PCIE_VCC3V3 for pcie vin source

USBVBUS is power source from the typec port.

Thanks
-Anand

> Cc: Han Gao <gaohan@iscas.ac.cn>
> Cc: Ze Huang <huang.ze@linux.dev>
> Cc: Chukun Pan <amadeus@jmu.edu.cn>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v2: new patch in this series.
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 3dbdf53b6d8e..6c06480ba100 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -39,6 +39,7 @@ pcie_vcc_3v3: regulator-pcie-vcc3v3 {
>                 regulator-min-microvolt = <3300000>;
>                 regulator-max-microvolt = <3300000>;
>                 regulator-always-on;
> +               vin-supply = <&reg_vcc5v0_sys>;
>         };
>
>         reg_dc_in: regulator-dc-in-12v {
> --
> 2.50.1
>
