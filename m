Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A71837F8DA
	for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 09:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768900375; cv=pass; b=a+EVuzKlq5lESKKuGpuSNx6i5eB2zn3w7lFos45FavO7sg3eQWS7K0paN6BxeQBfQZm9sylw96gdLMH+x1tkBKfO9SbS8tdg6IHaM1S+sRyefDiCgTXxx1SyRCRKartk1nuK/Vs21UlmGHwyDw6iKmFbHN9wZ5Fo21+3kx9X460=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768900375; c=relaxed/simple;
	bh=m3kBLRvqqnsqAfb6grqCh1VA5CCALQU1gL8CfPAlgPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9X0AwOwcpr8i5ISYZEsUt1+VNngtH6VTKx7gvWGWEIEekhcoKZ1NLhU25rpyQX65a3v5qqSgFXnD5/DHN2YcVlxS56uxIZG+7XDueYBr4DP6HzfcrP25CwvwksaXCUEGd/Vjuxreelw7AQd5/sEX+r/rLBQ7i91mBGuhPcjfds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=J5XdMspy; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="J5XdMspy"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79276cef7beso44121007b3.2
        for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 01:12:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768900371; cv=none;
        d=google.com; s=arc-20240605;
        b=cveEYS9hVHjCh4DMcs9YsYOLJ/bpolH/J3LwxrDeW6Jw/VmkHAJ9ZNoCHr7/D5/1IB
         PcteErNrxiwJv34eTmSMDbUME32O61qvgU7S4Wpq0TMSiJOf7eUk1tpWVF9M+BtwRglx
         8jewyQvoreEeka5h2e/uKAH1A0upnaxcHIfrcJfAtiPhY6OzsIYAexJuBnSv1NrmweOZ
         X8iTjRYrPikboEp8HtbWg41ci81yCa1dx5eQFbwttFoR8Zv4DPKqXmMtb3lU3q7PT6Mt
         IbuD21pWw41XyxeDWkjgPa6PzqsRErAyBtt9J1AufxYN042+Rb7R1+Qn6zXOdhsNBzdO
         n7pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PNxgsdZ6Vqh8ZsmPDkFdaFpUMUQSLQTx1/iXhsZCiLE=;
        fh=nE7aUTQkInyvl0S7Nk3NTXBCT5G3/+MMymSO2sBMWuw=;
        b=CMOuozp1ZmrsHwsAm2kN4r5TugGldhXfWYOSxpGBvZ4d4IBR+zVjHhCx7JDS0FJ38p
         qeEYOWyE4Tz6p8+d4UKcarb5CaXM3Frov2POot69kh8s1cHarHVhN99ugzynQ4FYOApE
         5ItPd5eE8nl0uC5SgP4mvyciSdxmZB6LH0xkBGc2DEW3eJ7OqBGWrBu7f28fG8itzdMq
         vLztU0Bq9nN2QWHUUaObsIvl9SJaDUeVpt1I2Z/FOO6CvIPG21a5ZhoqShPFQAZdW5VG
         eUgDBMEVMHc7imqISHKmkQW0PO1pT9VHZmVBMlCtmJR3SiiV/UrW2gyAstDoWHBlBhVa
         xfyg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768900371; x=1769505171; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNxgsdZ6Vqh8ZsmPDkFdaFpUMUQSLQTx1/iXhsZCiLE=;
        b=J5XdMspy5HIO8kTu/nGAOgRiGKjmz3SuTp6HMvkqihB8ivVThhXzl1yi/+z4kqyPhY
         9/3gjtF4PTEatzIV7mxfWqYCfZ0mEkEBJbHwTuLZ2As6mAmPO+yJ7izyDk2IrUYjEZmx
         V/yTh+Qp2U69062F2P0YESLna9cs4aQI62c+c4KHrSFTioYjyEwfG7suN7mrjaexWQ+E
         Gkj1Zm0b/U3HxCRhfmZgcjwm+VsOMmwrMYipwrXoxaRyf8AjzfsyhtOr0+yvp6TfCNma
         x74zxmYj44sIWxuVlz90GKNGX6SXY6dgysCJIZZCuE9ic7pYTVTQlEAlp1jEi7UPSlN4
         dVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768900371; x=1769505171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNxgsdZ6Vqh8ZsmPDkFdaFpUMUQSLQTx1/iXhsZCiLE=;
        b=s49fGRIEcocEk8BCPrwvI7ZktvKVcSEbgJr10ixpTMaUansVbU5X7xBWbEQO41KYfb
         PMN4dau5BsY7gtqiOa+Nenubgi2iz/tA8qwY7tnIulJXCHw338dLEOqqGk8eHSPzdryc
         LiCT18IHZ3WPbvPpvoWtTYpNNT6h8S0ORhCJED1+g7zzLo6OnuFFMOcp5jQegDbFIUDj
         LnKkpLtNpY6pwuaKe9TvQQUzDAlhp7iuDJ1iE3Ly6comNPcVY8GGMgBw8yTKJOFe8824
         /+1/AET5jqh2LS9D+rG3uWxznAJx1KVuQUc8N/oUKLXtmrKgUv1jkqdpOdixXx+r2cbd
         e5Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVxcM45lQrqSGywoV9mhfrE+KDtyeDWy3DNu2aJwOcktOImDANbgl/JL0c3ceel2KyDa8HHfiJT8A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4vaOp7iwc48/VJx2EAzY8hijV4X1d+SRQZCyjGHDTbmSF8gLn
	FAYBwZQ0r76hT1t42IHodoWtqtiwb+9aBTtlJoI744/jUs4mr8FZ3YeKLAGfmIUkK1CxYocBmQE
	WKKdSP5QJHrSGTg+1qW3qNxpQE9tGEytB9M8Fuqnc7g==
X-Gm-Gg: AZuq6aJlBid9Wbt72bd1NZv8z0IVZ9dURDurIylX9sDOz2gGNJ5HIBtk2mYZhrwijft
	0hcrestWjljKckpuO8DVGiaUslXlOCFRIf6h0tSgvCMC+crJE3KCcjGPMRLhQiGOuBPeuMoKjwx
	0AzvYKRNKL7XCMSCAfUBPf9kzTH41jSGxM91ztZxnrZtSd65GjZwM9HcmnGdPiUT1Voe/8h4m7E
	uLsqW+d4qrSLJT5IZlR5AojXE4UhVUO709A0Z5KihrBkrHujqrlQDg/3Pl1KDF6Mxe2nlkcc+ME
	d5rP+cEh0M9CEQoIuDW2fKLXc/EwMYsDIXPUWn071Qo5
X-Received: by 2002:a05:690c:dc3:b0:783:6f68:2a05 with SMTP id
 00721157ae682-793c5262618mr114246527b3.14.1768900371200; Tue, 20 Jan 2026
 01:12:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
 <20260108-k3-reset-v2-2-457df235efe9@riscstar.com> <f5a35fdc-9245-4be6-83a3-c1bfe86d30c9@riscstar.com>
In-Reply-To: <f5a35fdc-9245-4be6-83a3-c1bfe86d30c9@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 20 Jan 2026 17:12:39 +0800
X-Gm-Features: AZwV_QiSUZjFVgUdNJN_FK9z3phGCKu7RzMoyj2ZIW92mPGRdZzm_Uoe-7AvW5g
Message-ID: <CAH1PCMbxE05U0kp0y1qVcE1Bozpq9DiDvS83DHTsh5XxdeqVsg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] reset: Create subdirectory for SpacemiT drivers
To: Alex Elder <elder@riscstar.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Haylen Chu <heylenay@4d2.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 1:27=E2=80=AFAM Alex Elder <elder@riscstar.com> wro=
te:
>
> On 1/8/26 8:22 AM, Guodong Xu wrote:
> > diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/M=
akefile
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..de7e358c74fd7b0fac3ec2c=
18d985331af64fcbb
> > --- /dev/null
> > +++ b/drivers/reset/spacemit/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +obj-$(CONFIG_RESET_SPACEMIT_K1)              +=3D reset-spacemit-k1.o
> > +
>
> Didn't git shout at you for having a blank line at the end of this file?

No. But I think I can remove it to keep a constant style with other Makefil=
es
under the reset directory.

BR,
Guodong Xu

>
> > diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/spacemit/re=
set-spacemit-k1.c
> > similarity index 100%
> > rename from drivers/reset/reset-spacemit.c
> > rename to drivers/reset/spacemit/reset-spacemit-k1.c
> >
>
