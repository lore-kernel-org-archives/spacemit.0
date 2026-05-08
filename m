Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F9137C92C
	for <spacemit@lists.linux.dev>; Fri,  8 May 2026 07:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778225804; cv=pass; b=uUjbqAsh3bS1HPS9MKDJr24bVG/TCHbxdr4YvCL2LUKANQ9uIDmjKRcd+DkFEuSaBDVd2ceEnHj6wLPUtaQ8FUvOJYkyTu6LJJGx9qW+Rk9wU+hNcFl7SWBmoomDy56ZByZm7M7RAIjhHmVwdHBd50b6VmyHTBRbj8dp42pCoIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778225804; c=relaxed/simple;
	bh=B/MI03HFz5SSbkX8vKW3+B8Ef0T3tywZD9naDKW3hp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IK99Eb4f3VagUJPNWpJy5KRUMoO93frVs+YERPWdZxvH5pG1xTmJzAov17N7HjBCcqUUwChIScXSoif6vCD1SyvO2PSUoE7XcwCET5Hq2yvnzgskEnB5cYt3TXaV/nQUx/oE8LNYmNe9ZwPa5pAnpayZMwshGgduHMtDJuFeH2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYbiNylX; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYbiNylX"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67be871ed3fso3176243a12.1
        for <spacemit@lists.linux.dev>; Fri, 08 May 2026 00:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778225801; cv=none;
        d=google.com; s=arc-20240605;
        b=aTWa89tc7LKIipDE9XrZ8a5wumit8Z9WttNhQb03O3r8iGvINvFc7kV81thq+E4kNO
         UNLQ5vq2BANVnYTfl1YKufGex0FhoTe2g9GCX3ftj2ZkU1Crf1uTZ+atwzIBnlrdkA2H
         nd5WyWfulgthoMFlTiQvcuIplM9gVE5CIqJXWqK/KuQxdk1biVRktE3DzLu/O1+RPDX7
         Nc3jRRE5bQDtF+AdBld73ZYJ/+NrD4hXgVyA+K0Mt3ZdL8DclIBQYQEJHvCMHF2xURUj
         rirtsNimnmaQ5iHJCQBQLmvasPtKdMcwDqs09gwrYVodV4pQq3gbsdGCb4PQglrPc62w
         fx6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DT1bLE07vl0NRGAnaDV0P6+c6Y2ET3SDmigAcN1kcik=;
        fh=oh0xfmXbEb0wPLdTfYkm9/w6n4iU9iPdv/XrjzHH6UM=;
        b=golk1/luPn4wk25sDF80wFOkFCx9Bj1Q2OQyqez1Wugxib3LEC+G2iAjBWMlojVI+B
         CXTipwamhQvjWbj27tlxxeghjYH4hD1RZr20lqiV1WT9T8UHCGmFM+BGTidou+phpfQh
         9g5eF5UPbObUROGMzwyBE7bikEJ4StjckqoGkNr7EYGoPgn9yMJjqD8fUqdZzeOhTXLD
         XwocfoRXh2rgpkaGccDtpWun+S+OQ6QvXyMlyKdHBdU2NwZ5LMTEhGznLI6Ay66+Rsum
         tOCj+lqT3KYKUc/tot+JCiSSi2KLdzjrH8TIAJ8AwmlbFkhfElour3HjfjcBFwGdK0sj
         aaCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778225801; x=1778830601; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DT1bLE07vl0NRGAnaDV0P6+c6Y2ET3SDmigAcN1kcik=;
        b=YYbiNylXbLnSZ0YKwm3C9TdqD8QRWAVrWorcqKpbh0ICGw9lsMqSGdgEs9PcnwUbtg
         6argm8GimmZYIj2sndpUMDemPM/VEpFMyhiQ7JgFnYk6eZSlyM7sGwtGGPDtMGJeFL7J
         5+05SmoeEE8cEAVNE09+Quu9b5rqK5tmuYdOJNmqiyfPEvh3GSxFcQAu95Qs+5+sSSI1
         ZAd+wfErdn2o1zkKK5lfL+HD4R9MUsT2M35LqbRrI7oDGU1/ynm6dRvzzHqVLFbLeiUn
         Fdg+hYux12Q8N/6t79X+p3fwtHG0q2qbwk3PcCTb68V3qqmroH4nz5m6XKFEl4tSkdb4
         /ODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778225801; x=1778830601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DT1bLE07vl0NRGAnaDV0P6+c6Y2ET3SDmigAcN1kcik=;
        b=GNKYngBvL4Jfd/89rnNasQzHNal0d7nx0OHGwn+w8W6hMak3O0vtCdlYBihSh+Xk+5
         6En77a6PZKrUnzd1hE68LOS6CZvcUR/5otU/X775GG0R2sbLWjJzkt/hDojBR+3bnBUi
         YIinMBnW6GuPi87iIpPBY5lz3xJhFIVWgIauFAcPmuyS5trsQGSvVBwl5oKtzGGjDCEy
         uIu6BvKjT0CJOs7USE0wLeLOD/qtT0ycDIlgYYDNp4+qG6riR2XvrjbbBB/BZYgO1JpA
         kQvV6b4Dz0EmN14CxRt01CSMbXnnkqj66cpw6voI8teDPBxZ2aEufsDW/STi2xIEpEsV
         viLw==
X-Forwarded-Encrypted: i=1; AFNElJ/M9fJFBs51hEUa/zUPN2cDTXDkegtecykdxA6fxQ26u5cKgBGuEycRbgQOh6ewIvC8T9tcLNlUqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YypetqDAqBc+97N4TpWkkiruOdxkuDMtGFcIufQkTDLDfNZevCp
	zwcZmVcSJolea6lUF1zdna/MbPp86xHrVrd42eHGraoPlkOZ3cfx4KynWFlr+y6tdJnThMgPiKv
	6Z3RMMhKsEzkBWKotte2PLmSWY2f0A2Y=
X-Gm-Gg: Acq92OEVAVaKEcmCvZj6uPWCgnEfzFXaiLihNPbh/yG6oJpD3nYFB26d1EWUiCD5/qR
	5neDhLTEAVts9t7fNXlAQJtK7LcGWAjst7dHlzKUbYVBNb7DMHASQCS/z3MicHnuIkRP6VQkHes
	sTcw9T6TF8d7xF+Xwvul1lMsbejVAhPm3t7OoZH6g20tUm32KIxyoaydMHFg2V9yadOlYA4YbDo
	XBOH2gavKCriU+oAtx950ckhye4HlxzSvFrkiPREmaDrwI4944aqdR9cHJx5oPODem7IXoi1nzm
	ts0z
X-Received: by 2002:a05:6402:321e:b0:67e:43a8:7b82 with SMTP id
 4fb4d7f45d1cf-67e43a87cb9mr2854983a12.26.1778225800798; Fri, 08 May 2026
 00:36:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260502051906.8160-3-linux.amoon@gmail.com> <20260507064050.1881348-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260507064050.1881348-1-amadeus@jmu.edu.cn>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 8 May 2026 13:06:22 +0530
X-Gm-Features: AVHnY4K-9ASo3Mc0vrsENtDNPwVrAYJ43tcUlhhO5e_b02Orqs4pqqj-5Q78Vqk
Message-ID: <CANAwSgSP8W8QH26-X-mdNBtncDAbHR9CtYRO0F+rjmxKfhDt9w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] riscv: dts: spacemit: k1-bananapi-f3: Update USB
 regulator on onboard usb and label
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, dlan@kernel.org, gaohan@iscas.ac.cn, 
	huang.ze@linux.dev, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org, 
	robh@kernel.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Chukun,

Thanks for your review comments.

On Thu, 7 May 2026 at 12:10, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Hi,
>
> > @@ -366,7 +366,7 @@ &usb_dwc3 {
> >       hub_2_0: hub@1 {
> >               compatible = "usb2109,2817";
> >               reg = <0x1>;
> > -             vdd-supply = <&usb3_hub_5v>;
> > +             vdd-supply = <&reg_5v_vbus>;
> >               peer-hub = <&hub_3_0>;
> >               reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
> >       };
> > @@ -374,7 +374,7 @@ hub_2_0: hub@1 {
> >       hub_3_0: hub@2 {
> >               compatible = "usb2109,817";
> >               reg = <0x2>;
> > -             vdd-supply = <&usb3_hub_5v>;
> > +             vdd-supply = <&reg_5v_vbus>;
> >               peer-hub = <&hub_2_0>;
> >               reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
> >       };
>
> This is incorrect. The hub is powered by vcc5v0_hub. According
> to the schematic, 5v_vbus provides the VBUS for the USB3 ports.

As per the schematics USB3_PWREN (GPIO97) pin is used to power the
USB hub ports 5V_VBUS, please check this again.

VCC5V0_SYS -> USB3_PWREN -> 5V_VBUS

5V_VBUS is used to power all the USB3_TypeA_Dual ports.

Thanks
-Anand
