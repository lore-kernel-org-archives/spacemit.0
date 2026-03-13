Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8433A3E62
	for <spacemit@lists.linux.dev>; Fri, 13 Mar 2026 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773412943; cv=pass; b=ZU7fkVP5MxThHhkoCyEI6trjlFBnir8yUbZz9CFbaqxsM18+gNvzP+qbISkNDpR/XmhjV+7ESopLxXEi5LkxL6G5m9cuvrYYsc67GnkQyjTmlTlw2K/o2F8PNnPQHSlyiHM2a57UKvv9Naz7JEl/DdaK/eCBHyJpQmCXtgy2uRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773412943; c=relaxed/simple;
	bh=MV/eXRShZGoChKIqTWx3xRDJY4D5p1GfCWHVtdLntcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TkbcP5EhKs8oxr+99KgfvzBVczYirGEwKtkJLnaQyf1pBHcLaAwxgRnETTPCMx0960rZxGrBGxWAOeF7zwhzNYnGR1rT0ynPDjfxzNZA98JSjKb5shRgIV/NAfGG5Awhf84P1rr7H3QgKKFtjja25W2hWFJ/Ex/EJDHpT7FPCJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACHNR7l6; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACHNR7l6"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-89a1c6dd788so22870156d6.0
        for <spacemit@lists.linux.dev>; Fri, 13 Mar 2026 07:42:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773412941; cv=none;
        d=google.com; s=arc-20240605;
        b=TKjW6M2m6PRFs/uujyGQwExfWMlLbxc8GPBIk8UXaPrXraG5Whc2sUX4AsAejIIWeJ
         8F0qVv4x+kQBkDQd7FiMBTvpCrXOD5gNUF2HKmm0XJ/J5A448S0eYUzz+Cvai8dIaYu1
         lu4LAb0fDNeq6yYycS/y7DzNWGV8ElH97rae98lUEob6GNBn8s+j98YPJnwWodJdok5P
         Ey7ujGE76P56CG/uH122dQLwQ9ystR1pyGulyjAiptWJhs/jLt9L+akl36E920hjk6jV
         jyymehE70sp/gDJgo3QVNszfpwsDDFXOibrsN2n+wJhidq8NbUufVFov4t0EMm1ykLB+
         BUog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qc+mZxTV+FdzmhrCNMAZNBcHZoz8P43EP82OiNbVxfA=;
        fh=xiPFTTPA2ej1dyNv4nWWV/iwc6NsVCvpXSGvbLUpftA=;
        b=cImsquuon5IjgV7yuZRjHcvOaYMNx2ijLEORQIFDRMivdoOW769ZN89G6Iv0pYJIGE
         gB2Z8sVUbZ0EUP9bDRrB6H+bawRCxcSdoBfsnR56eGulyBlJC4lf8RbU7sWuR+TiywI7
         CFo5xTVDbsYLMbJZ3cWxdMtHuht3hxdNcupAjnGfG8IFOLc7ZA6rXCQfz7av09qkzmaj
         Bta8k6iE2yAxMsEsMRh22dbwEcmrQrDTjcSf/lF0F/vKj6e87TzS7hN9y8oG5vyzn6Hr
         O2YN8le3GE0zJYgZr7z60FfjS4ekwyT0nAVcDt5umVDtH8pcpsDN2ugyKGEekQaPRPnB
         ZZRg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773412941; x=1774017741; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qc+mZxTV+FdzmhrCNMAZNBcHZoz8P43EP82OiNbVxfA=;
        b=ACHNR7l6Wa268hhxLay0IBxW4OXW9sxEqDhxmdAYjw/qUbXidaCPTI6UH9c0L4xDM6
         qi9JscT5F39DW2g86EqSSpQT6vxw/PgKjjWHz1FKgG5b6w0NcgJUZKdQ0YTR0HbgTxay
         NEFDCSpHWqhYRn4W1oYyaz6jj6EWfxXFvSPN+QXVVFxhmwY3PBcUamKIacOKKNgsIxqn
         +pO0t4Ueho1uiFx4oAjEJMsq5FtHFIdO40xF9KnO3orEIe6e+6rpYx37ILuC7BjVo1ZQ
         9kD0ivPA5Jvq53kxShhUUp1RheyANKgNpBTmEXiRKHmiQCQAvxU6vc6FwdPALdXT3MFV
         6aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773412941; x=1774017741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qc+mZxTV+FdzmhrCNMAZNBcHZoz8P43EP82OiNbVxfA=;
        b=pZp5/9LtaCiQ4K6LkQrlWvPsDxTI4ANvcd9oxHrx7HJ7VRmnrPObAdpwd5RDz/SvGM
         8casrAgSWDDFUwUWVPb3x55sMd3ANUcWsrlMNmIGhchnQd7DO3WWfjIKY5JYY6ZSlgG9
         ujkNcjwSf4wmRcEJje7Q2+16g6o1sSObXtOTjZVVaFV1CTqPArr7tuuSTbI0mdMwdfPv
         JmbFep1jxEMVIiWZK4E6eR19lIVEVOJB0KKYFVBWGEpiwJ+nwJcfKOO0JcAalmwpJIo2
         7IYC/CD0N6etEBq4YD2LEh+ROuLxg+0xQKuOLYnsJOCAF3ZSU1u2sTmTdluIuklxeoW7
         vK/w==
X-Forwarded-Encrypted: i=1; AJvYcCXQkRHp86oHStx2RXcOiChQ27glJlOZA9qwT26fxuiDKHsVYbCJalmncw58En/XWHzVqKkq1qa+Ng==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6aTICRG+nFiwWZgl/qI9j4LBs1hjz1ULtsCDcplHGc4Q7gUGS
	3DYPM2VRefCGhfeUmGAy5IhXVkMDPsx6dKcinhWH6pZnboURG8uQ/ltJ1CKWnXudVl7Ddz4zswT
	XMm1URgS8oXPhkYieHF0G9w1tydMO9EU=
X-Gm-Gg: ATEYQzwV+zGBt6/Xrt5BM1pDEJrQddFKrxMG3YY/Xr2W1I8ILfY/bbGoIwBe2Q0DrPz
	xF0wU2o+VRzzcboq5usu/XgQ2SyUdb/VOvr+gqDPZk9LfdEpjCi9zrtNIwI2ZffeiJSCJV7tBC4
	lShRNGODzPVsPrIYbiocdpFvrfp78oowlMUDG69yErc4r6jUoO2tlG0OJeLzJqc99R1pAkoEN5U
	Y6cysGTiPl/6FWXk1WxwOlab9tH0ZmapPCJoG2m0C3WK2EhA1y9TdbOdwF5iXKDNP1piOpa4N4L
	J7BAaw==
X-Received: by 2002:a05:622a:1a8c:b0:503:4251:6597 with SMTP id
 d75a77b69052e-50957cc6720mr50149121cf.29.1773412941102; Fri, 13 Mar 2026
 07:42:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-7-5bb2b574df5d@gmail.com> <f2eeddcb-712f-4a67-9687-e217f46f9ea8@baylibre.com>
In-Reply-To: <f2eeddcb-712f-4a67-9687-e217f46f9ea8@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 13 Mar 2026 20:12:02 +0530
X-Gm-Features: AaiRm51P57qcJuyAf0DEi9SoGi5rXwcJCFXanh2EQoeiyawGvbU2ynSwbZwPkSA
Message-ID: <CANAwSgSjsn46p13LokjYZBLdOrUBTFsmDNf80TG=nvkqHWNkfQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Trevor,

On Fri, 13 Mar 2026 at 19:26, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
>
> On 2026-03-09 07:40, Iker Pedrosa wrote:
> > Add complete SD card controller support with UHS high-speed modes.
> >
> > - Enable sdhci0 controller with 4-bit bus width
> > - Configure card detect GPIO with inversion
> > - Connect vmmc-supply to buck4 for 3.3V card power
> > - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
> > - Add dual pinctrl states for voltage-dependent pin configuration
> > - Support UHS-I SDR25, SDR50, and SDR104 modes
> >
> > This enables full SD card functionality including high-speed UHS modes
> > for improved performance.
> >
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> >   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 19 +++++++++++++++=
++++
> >   1 file changed, 19 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/ri=
scv/boot/dts/spacemit/k1-orangepi-rv2.dts
> > index 414b03f5e6480f05f5d7eeaaa0afb4e86425ae36..361135269801f436703b6f1=
d768c91325a52f07f 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> > @@ -140,3 +140,22 @@ sd_vqmmc: aldo1 {
> >               };
> >       };
> >   };
> > +
> > +&sdhci0 {
> > +     pinctrl-names =3D "default", "state_uhs";
> > +     pinctrl-0 =3D <&mmc1_cfg>;
> > +     pinctrl-1 =3D <&mmc1_uhs_cfg>;
> > +     bus-width =3D <4>;
> > +     cd-gpios =3D <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
> > +     cd-inverted;
> > +     no-mmc;
> > +     no-sdio;
> > +     disable-wp;
> > +     cap-sd-highspeed;
> > +     vmmc-supply =3D <&sd_vmmc>;
> > +     vqmmc-supply =3D <&sd_vqmmc>;
> > +     sd-uhs-sdr25;
> > +     sd-uhs-sdr50;
> > +     sd-uhs-sdr104;
> > +     status =3D "okay";
> > +};
> >
> Hello again,
>
> Thanks for doing this work. My colleagues and I have been testing this
> on an OrangePi RV2, and also a Muse Pi Pro board (making a similar tweak
> to this patch in k1-musepi-pro.dts). To do the testing on my end, I'm
> applying the patch series on top of 6.19 in a Yocto BSP.
>
> I've been finding that I see issues with the UHS support on my side
> (this log comes from an image built and flashed to an SD card):
>
>
> [ 1.072417] sdhci-spacemit d4280000.mmc: Got CD GPIO
> [ 1.109741] mmc0: SDHCI controller on d4280000.mmc [d4280000.mmc] using
> ADMA
> [ 1.114589] clk: Disabling unused clocks
> [ 1.118421] PM: genpd: Disabling unused power domains
> [ 1.123249] ALSA device list:
> [ 1.126[ 1.129949] check access for rdinit=3D/init failed: -2, ignoring
> [ 1.133284] Waiting for root device
> PARTUUID=3De94bfdd7-a36f-4315-a480-476e2a12403d...
> [ 1.176569] mmc0: new UHS-I speed DDR50 SDHC card at address aaaa
> [ 1.180732] mmcblk0: mmc0:aaaa SS16G 14.8 GiB
> [ 1.276268] mmcblk0: recovery failed!
> [ 1.277351] I/O error, dev mmcblk0, sector 0 op 0x0:(READ) flags
> 0x800000 phys_seg 1 prio class 2
> [ 1.286346] Buffer I/O error on dev mmcblk0, logical block 0, async page
> read
> [ 1.293891] mmcblk0: recovery failed!
> [ 1.297289] I/O error, dev mmcblk0, sector 0 op 0x0:(READ) flags
> 0x800000 phys_seg 1 prio class 2
> [ 1.306269] Buffer I/O error on dev mmcblk0, logical block 0, async page
> read
> [ 1.313522] mmcblk0: unable to read partition table
>
>
> At first I wondered if maybe there was an issue with the card itself,
> but by changing the sdhci0 section to this, I'm able to read the SD just
> fine:
>
I used the same example on the K1-OrangePi-RV2 DTS,
But it=E2=80=99s slightly different from the one you=E2=80=99re working wit=
h.
I tested on the latest  7.0-rc3.

> &sdhci0 {
>           pinctrl-names =3D "default";
>           pinctrl-0 =3D <&mmc1_cfg>;
>           bus-width =3D <4>;
>           cd-gpios =3D <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
>           cd-inverted;
>           no-mmc;
>           no-sdio;
>           disable-wp;
>           vmmc-supply =3D <&sd_vmmc>;
>           vqmmc-supply =3D <&sd_vqmmc>;
>           no-1-8-v;
>           status =3D "okay";
> };
>
+
+&sdhci0 {
+       pinctrl-names =3D "default", "state_uhs";
+       pinctrl-0 =3D <&mmc1_cfg>;
+       pinctrl-1 =3D <&mmc1_uhs_cfg>;
+       bus-width =3D <4>;
+       cd-gpios =3D <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+       cd-inverted;
+       no-mmc;
+       no-sdio;
+       disable-wp;
+       cap-sd-highspeed;
+       vmmc-supply =3D <&sd_vmmc>;
+       vqmmc-supply =3D <&sd_vqmmc>;
+       sd-uhs-sdr25;
+       sd-uhs-sdr50;
+       sd-uhs-sdr104;
+       status =3D "okay";
+};

Thanks
-Anand
