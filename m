Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65AC3F4101
	for <spacemit@lists.linux.dev>; Wed, 13 May 2026 14:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683189; cv=pass; b=nqZ6EeJw4pQKpgcChIjF3JEPrBEQoMPc6AuZHN96BxoxjZuegU5tIayAa3zQ1Vg5bf7CzPIJ8kYEpfiHrMvsl5XyxEdYcXK3k959yuA/u1t5kTGeZouuy02nfFXTnUUTo8i4zcYcb4q4skhqmIBeTnzA1iItUnA85qhnSgKTR2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683189; c=relaxed/simple;
	bh=l/XQjj9rLqRtlvBFVD1JrhsL5hgklQZ3IW+6owvNEYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bew9n0KmjhnaSdvpYC4eoxusZbekJnwW0fiOt62a5zZoG3F1IA27P2KC9AmcWnZVEOKFHerQCFZEyExNU2mJW/6hgUupQpl5mnd0IzbiIUzpa1kIg6kF6FY1BUsK15Ef4E1Cf9SCQI+SQQUB806y/LWiEKxP0N4WPta+4cqWqOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFiN30Jg; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFiN30Jg"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6763cc8775cso13792001a12.0
        for <spacemit@lists.linux.dev>; Wed, 13 May 2026 07:39:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778683185; cv=none;
        d=google.com; s=arc-20240605;
        b=Kvo5rs/H8zMR9qIz6zmiNiqvBpoOHQKtaPBomrpx+oX5qKI6gY9SMpJiMzkOLPtLbQ
         u3Mi5/0ufx0pT6+fKzYUyxClEfD1Y9e4PkjgOB9l8NN0ThVt8QI5kE9jGp0tq9NgsNDA
         ctpvXo8tFvoEtE6s7/1wI3xkHFlhlBz4xM6xpdCAhorITU2NPJsTslBn+klYRhh1hM27
         GxzuO5tzxNb0VWKoRtGLTDbzERD6YgHpfQnkdfp18qwRjFwl2q3hcUKq5lZYzN535LQl
         3su8dO4Ss/GchLR9H88Eghs6Eg4z4L+yunsl35+wxL5j3WUJKMbIdZebxeI/dkIBIlBz
         ASgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OaBPAaai2do6tTEr5ZFJIJdibTEdzt3Q2IEnGfklUBk=;
        fh=GzotEn5USsuuHLR7UZt0UfbjtxTMxfk6G9Av8PLPnTg=;
        b=knT8soXHGahMOtQjVhKZ2myVZcc1AW+QkVzoy8eCEQtSMse4oJgyqIe1o5UgAVsvhF
         5sXBJShKAJBcc+VkiM9FOO8ahctSAzQq1NzPGi6qqyBekaMxiXvdDmbE7hFP22QcGxHq
         KOwFnH/qy4o6mhVt1rXp7DFdn1EItQhfWKNd4jL+wO2xhlz/IJqGk394fbpVA0DCk4v4
         SKXl1+I146jp4wTRxv7rg27mNwOb742itfkDzU2GdgAj/u+tSMg8npc/mSdP/MVVqacX
         zHMh8TU8XxHs9fIUZQOnkdnUvtVKlG6njCyxW+l99tUmwvNtIYyXEc9Ir73PvYB/SJ/F
         AsFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778683185; x=1779287985; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OaBPAaai2do6tTEr5ZFJIJdibTEdzt3Q2IEnGfklUBk=;
        b=ZFiN30Jge6pWGZsr20rlCnk/odBEBBMFmDZMPtmp4+LKBpwLrS8ktoIux0HY1fPNea
         AQjobFwY27QzMOBDRuevTIbqiB2CIymSKWKZt3YyBBcoF1RV38ODOqlI8vlBd3cgAPQS
         agsEaus9obhNtXvN3wp6PPBCdo+GatQKXqd7+PwDM/kclFsMnO6nrs2gctXmTUBin5JW
         7DMWomZublaZnU/OjLu3xaWr13rv2WXp9rLYm8oinjm5hBp//0fpH5rzr7sac2m1CBjR
         MmNrDRrjysWbSrce2/WaBUfXzRcn4PXYusTqm/u8wmxMUxvg6qJQKeORvar+/H7w7pYD
         eq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683185; x=1779287985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaBPAaai2do6tTEr5ZFJIJdibTEdzt3Q2IEnGfklUBk=;
        b=oa5YjGZ8K/VbErKmUd6U5pVLLh8muLtOIkysdMxp6+Eeeot8o1G19m+L1Rc4h+1HaF
         WGnVpCBR+VpngWzEs95GbUmJGvgQwj+GesuazdStH2CtrQoiDl/GX55o15W4lkfowFSp
         YYqgI/ay5qjS7lCkdL5/YWCrKHe6SKE+cJNq8JNjJ4ihGhWkCyiiWFA4D7YPX2wpKp5v
         CGeQv5znvGrusqEnDzLZBOwt067UCs5AGLymsKsqb6o/nOVFfksSDdPEjjNKaBECskoe
         eI9IUsoDBb1fr2m8SIgS9qMFB+D2Ua/BAOo28T03l2dB0qrkXXSdMCvcA33mim78jQ68
         GUeg==
X-Forwarded-Encrypted: i=1; AFNElJ+eRGxPUXNdiZAI2ANYXKzDrPnlpiz25bhBNVtbZClGPfHEfwNKpaqWhjyToYtwwDFB/dfdmh8u5g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuT5JwubEdQZO3lm7Q53Mg+AtlQ7Qo0G2duRCZCYbnHAHoeJNB
	XpKwulKkW/9vXgjpcepzlCgdHLqg6QohT09pzaY6Mj0Vimbsc+IiRPleqCStWtOQhtSYTDWq18w
	MtlaOsAHRXWbSaVw3145I037OvvMhX3M=
X-Gm-Gg: Acq92OGLAn7Wvyu7TdYBaZstHcnZaKljZ0Z01vaR9EI5j7TEG3Fy4KzmFIrXWFlbrjq
	6fZ+jbmprDgdqas83R428uERcUZgoRQIGsBnAYS03AV1K38BJwlK6CDisT0By1ltACFZcNmGN1Y
	VNIn5OJ3iAJ5aEQmd386gCAMr2HTjiUkkwWry+RFVeRby3j7MOeEtAzZPeHzwUEA3R2e+5Hzp1A
	F21YGYot9w3PhBtP+P7jbofHycY5P5iOxPzNySnQcLnuCl8iYH2FQz7fArkG8gAGsCLar4C/PvN
	EZDuzw==
X-Received: by 2002:a17:907:3d43:b0:bcb:b15f:14a1 with SMTP id
 a640c23a62f3a-bd23aa1844fmr479690166b.7.1778683185065; Wed, 13 May 2026
 07:39:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANAwSgREs-Ai5RxuiD4Ue-8OGGdrhnLSBmSePBrjN3x9=59zrA@mail.gmail.com>
 <20260513105030.1074335-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260513105030.1074335-1-amadeus@jmu.edu.cn>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 13 May 2026 20:09:29 +0530
X-Gm-Features: AVHnY4LObZPjOHYcJad_9LeD-36GYglsaC0zIs_XJX_NY4Ny0UPRl2ZDzVqaAoE
Message-ID: <CANAwSgQ5-ATFGESe+=sEuGfEHwqDxg6b_QL=WJSV0gONFLmiZA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: dts: spacemit: k1-bananapi-f3: Add
 vin-supply for PCIe 3.3V regulator
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, dlan@kernel.org, gaohan@iscas.ac.cn, 
	huang.ze@linux.dev, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org, 
	robh@kernel.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Chukun

On Wed, 13 May 2026 at 16:20, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Hi,
>
> > @@ -39,6 +39,7 @@ pcie_vcc_3v3: regulator-pcie-vcc3v3 {
> >               regulator-min-microvolt = <3300000>;
> >               regulator-max-microvolt = <3300000>;
> >               regulator-always-on;
> > +             vin-supply = <&reg_vcc5v0_sys>;
> >       };
>
> > Plese check power tree page 4
> >
> > USBVBUS->SY8386J UXXX -> PCIE_VCC3V3 for pcie vin source
> >
> > USBVBUS is power source from the typec port.
>
> So this isn't from VCC5V0_SYS. USBVBUS and DC_IN can be
> considered as the same power source.

I am not the hardware person. USBVBUS supplies 12V, and VCC5V0_SYS supplies 5V
As I understand it, SY8386J UXXX serves as a step-down DC/DC regulator
for your PCI device.

[1] https://datasheet4u.com/download_new.php?id=1604744

USBVBUS is the input for the PCIe source, so this should be vin-supply
= <&rreg_dc_in>;
It is as per the schematic

Thanks
-Anand
