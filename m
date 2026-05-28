Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC15C2C11F9
	for <spacemit@lists.linux.dev>; Thu, 28 May 2026 05:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779945534; cv=pass; b=WHsuG0gZm9qxKv39k00R/Fm2yf/wQHe8EMmIpABiHB12bUtMdWM9fuqi+cjBL04sctrpTzMIjnIJruVsKX6UlguDA4xowwo2E6F0hPyJvL2djK5/N3Usb0YHAM2TYQrGmhOOTM4hovWPcCYv8VMIYNTkRaU4VX2wGSBIJToeUi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779945534; c=relaxed/simple;
	bh=K5J/i9QQFjNtTNEst0+r2fQ7v/Sikc7WovZzz3fcli8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTf0LdYeP30owUJMNRhGYiOawLu5qyCJrgGGdxmiF3Fso6yfaVe6p1eXED5WQdUSHPgUwzbhUFMMKChvwgdU0M4qHZVuEtVh7HMg417kz34yfjqtELaR2OCkDG2v4FhTqbQoc+sWPPN9EmSX9T9LiNj5yvAWd2ai7fSXMTwPAxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=XQ8XPvln; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="XQ8XPvln"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-660390acd71so664005d50.1
        for <spacemit@lists.linux.dev>; Wed, 27 May 2026 22:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779945531; cv=none;
        d=google.com; s=arc-20240605;
        b=Ng5WN0ggCFZRa1eL9Xi707SHsz8yXb9VElt6zgwsRQvwGV4Gwr/Rsn1hKUg+FXmggI
         NkonkHwRPpLQAPQLh9P38gAmh1Jn0rw/GvEnsDqEEE5o/eDqjN3HdgP8OSpnJvHF2Lli
         efgkwPrcR7xBoa/eMgtk+5U1QaTFkUnwDYd4MdKPQTlbLzl0YXXlEW3eeP+n3ltYK5Jy
         dB6OLkwHdT0RrQ7VvxwRtHbLSVYgWnC/JdJRPoZXoYuam4ExTp2ldej7zOS3cO9R55QO
         gD9KwBB7x6E2p253S5XXV+z79k2FMNO4y0gx3zyGEvVNyVan8mlg0jbV68IBBzYOXMCe
         JAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WTNofcIOZbXjLpaLD+DL3cOLpKPj2wtfgJ0EVk0XvKg=;
        fh=1zohWL3jUFKvbC5BMc+TB/wLG+yJR9wbuWEZ13ZV6yg=;
        b=hGkf4IlVSTnQngEiSWs2MJHYrlG6fP7kp0p6ta7ADtZIuDm183EukNo3M1vhihmVqw
         SlKZxCdIAzQzda8KFYf6xdkhXruW7zD4cd0jm3OgMH5aAmQNa+NAHN73rDHRx0NIG+dU
         /YDlZZNS1D/e8piY5Vgg+phlZASa9jFlWyScBhAsHXZm+NBmFB+nWWddyD7SCouLz9Yg
         4yuaf6AHTUXvRbOaz1LP7Vjz4sG9+S9aGd23PQffpM8ucXxn3JSrhMAR/IBnaFD/jVym
         8q7ou7WcARebGunYQIQk/hagePYOTDtrG+EPsV7JcfjF+1P/Iitzps2vVy2xAIHIUaeV
         vPsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1779945531; x=1780550331; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTNofcIOZbXjLpaLD+DL3cOLpKPj2wtfgJ0EVk0XvKg=;
        b=XQ8XPvln+2gk0OFvrAdZDt5YSJWUay/uCJo588ejN/gSnfPJYoR0+C33Wccoe+F8EU
         6Hil/CfF6wNWqLLdO5OUHQKBY04z2a2hML9eIGvP7UeWXKGSNafTrowYtPtNIYw9R+AF
         1Ri42DKFDe7y1pOhD6QrI56s5x974rFqaFtnh4hQWaCh3OmcVenevkt7xC8bmF26XEzr
         v27IE1l+OiMxiqf5qKfeXkc4oA67j+CJ4CYJ8qMzIYw2niXyE93NpwfCeE/9jbcLjk19
         7gdFTl7ZRNGIcWQz2NmpdCi7ldxI/adrayeIWst2417j9eUEDawBNI0HCYA26LrvxpMP
         T3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779945531; x=1780550331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WTNofcIOZbXjLpaLD+DL3cOLpKPj2wtfgJ0EVk0XvKg=;
        b=kqW/LiktlMs2dOwZI9RrSg/KjUCA5F4WoRncXWJnOZ1qXjJrlVEcNM06mQhb6ikVvo
         aTAnDCvKKVv2YQHNhPuCoKGrcC2UtrdvxvjD/J4muDygS/Fdbqm2UwSItagyuU3TQTTU
         NMo3CJV5RsnACXWHimy5pY3i6PEIai+8M/u2+mnDhrsjGMG7maWUYYDb/iEagUVn49Zt
         yxmYHW2YtTTEsjSyz07FatE0TkBoZdfL09D8dWXQDlrQK0Q2ubr6uLD0zrxiTe83VkIw
         nU9Px/DTezQWkHEQovRUK3Cn/DJ4sDD0eZ0uiKFrVMLt+6T/dgT7CuRHJ7hXBPGT8P97
         9Nzw==
X-Forwarded-Encrypted: i=1; AFNElJ/alV8YNgVcfqWYTl2JzyRZ9/rt6oBPsM1YKeH1ShkzvPC74Vj86cxhJ5zyRt/6bnbO7MvttgOF5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3VFA4OBJ6dHricz1IVJ0kO9DC+vtONNRK0E6OVaWR2PqSyk3A
	Ewu1qmySR1O0TJx98ApH6Sj8o36FOzlbUh+RPo2Og86QuH50N3IBBfmScRKS4T2tH8OF7siQARD
	oy5/KYXU8mR+SESIEMfLyG8nerEX68tz6wUM+IC6nBA==
X-Gm-Gg: Acq92OEYaAAH+I5qVFcReRkDq5IV1vUxBHFSzyfpXxwv4Hn5mIeGtzCijTRHufV+TmU
	EPEf6idEdJ/RCUEBDkpL4KOoSISmEXwr8Qo7OuZDmO0kDJpQRjz2H2LD+Nc10rvY/6M9kMkedRg
	UC4i9OYxey5jaQbIKCzMUBHhmmGEU40NkvHa5kKv7paiH3I3giFrK6egJmAnWZqY5hiSxS0ncTd
	3COJU1kb/qknAXFIqbWWWT9aJD6VF2/m2iTEhDGwMoUcIsUWo8Wx4THPZbQ1TD/fzJd6OC1Nbke
	1eMsdSLzvWZN5eEOQWNhWNFF4crjga7BZpLnW6UUWBk1KsGxfyR74A6c10T2Kyfab2qKfEHYqEg
	VDQ==
X-Received: by 2002:a05:690e:1181:b0:654:6450:19f7 with SMTP id
 956f58d0204a3-6604471b0bdmr104584d50.0.1779945530981; Wed, 27 May 2026
 22:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
In-Reply-To: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 28 May 2026 13:18:39 +0800
X-Gm-Features: AVHnY4KOywjUf4xyXWLMCKeI0N-wdBoPItg6KtOmuhSwAAW2j9qgS8Kea3oyUX8
Message-ID: <CAH1PCMa_RJ0NVNyxkqsXPfrF4tz_69ZbWeqkh8xRCu7bLDkr-A@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Add Ziccrse extension for X100 cores
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Guodong Xu <docularxu@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 3:23=E2=80=AFPM Guodong Xu <guodong@riscstar.com> w=
rote:
>
> Add the Ziccrse ISA extension to all eight X100 cores. Ziccrse
> provides a forward progress guarantee on LR/SC sequences in main
> memory regions with cacheability and coherence PMAs.
>
> The SpacemiT X100 core supports it per the SpacemiT K3 hardware
> specification.

For the record, I have tested this change on SpacemiT K3 Pico-ITX.

The stress test is run by enabling CONFIG_LOCK_TORTURE_TEST=3Dy then
boots the kernel with:

  locktorture.torture_type=3Dspin_lock locktorture.nwriters_stress=3D16

driving all 8 harts. It survived sustained torture [ran for ~10 minutes]
with 0 Fail.

... ...
[  735.588947] torture_spin_lock_write_delay: delay =3D 25 jiffies.
[  738.015096] torture_spin_lock_write_delay: delay =3D 25 jiffies.
[  739.204713] torture_spin_lock_write_delay: delay =3D 25 jiffies.
[  741.195211] Writes:  Total: 714319420  Max/Min: 45946599/43679876   Fail=
: 0

Thanks,
Guodong / docularxu
docularxu@outlook.com

>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
