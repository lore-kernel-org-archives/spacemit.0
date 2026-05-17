Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDC22D0292
	for <spacemit@lists.linux.dev>; Sun, 17 May 2026 04:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778992570; cv=pass; b=hpHDyy/dMw2RXVfsUFZKb9sK6DQWDREyOVAcI8L3VZJRKd/g1NzsLYwTZRGur8NtNhwcZrI5xbXjCks4ribUttgrDEXufZ0tadeu+44WMqqIwK+qlaZubkx2FE7nRj+exNc6OSmcN8jAnykk61wK0tHcQmKlzSJwY8MmKgi+hKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778992570; c=relaxed/simple;
	bh=3ROR8haixq5iyUq7s9jdGclt/nlPcyVxpVzKqaY2PhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=kL7QJXdl5eN6vtCRbncdIQaHU75mWuG4ySZem+GgnwDHsvzWNdfVBTQfH/cUfTmMsDXXwVUI8MqESMy+dhrRg2Ety4CAvsFDgnvL85GnmzGNZ6/lvmb5HoSbtdEaUE8kvq0+QG0RP87v6ke3pHrJRc3oeLpatHrsMkaT+o6PFpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j1fpPGBQ; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1fpPGBQ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67929ff6dbfso2178249a12.2
        for <spacemit@lists.linux.dev>; Sat, 16 May 2026 21:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778992568; cv=none;
        d=google.com; s=arc-20240605;
        b=R2ocPHKb6LypOA2Dnyuc7HqVGAqyw8NRG4vkP1ekUXWx93lNeiwBhWEs/lTvLkKPLb
         l5adLMTXv3w255HhTGhVMz6CuLrFR89WdoIoc1jS8b6h98MlNSx4RaO0qgmcq03a2Z1i
         6wFeuOmeZJ8Onv7cWgH4+Sw+9+upgk+UpUmajb7himdyMaJBCGEthDlFDUuIJzjpfwHz
         +SObQ6qWM4qgoSBim6YBu8aVD/EEtFb5ZjR4iwZ2F/F0hyA6zPY0/zZe1aP6azro47+i
         xg7+agCNRXyTIGvKyFP0gvGRISVkV3dG/KtYyD+csWGHFggTy4QEKWfanY46X3h/sda2
         74uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JQM4qBv1wE3brKr2hKxWej6MOZp+Tj3Sd6cgQ9f4fd8=;
        fh=TdlCAgyQv4ZAaqHpKt+74t2nXbBdFL7SGhh/W9aIOuI=;
        b=ClXWZpnqQlgHz/QPxQy7gmw+edn//Jz+nJOSyoqH7POtGg+X+7im12cd4DYUquZbEV
         f7XDYJ7gsclvX8hBmi33jcUssZ+WwQnrLjmjEDZ7bGZg9OQ9hBnQQHZrfltB2ucwDAJI
         oUZrLlNEf91wgmoWiEWCh9JCq2KMFfcvo9gyii9q3rtofeAtTygaPmW7eFs5BqG0itU/
         AIeD8Uwo6W6HkKKRYwEo4z6GhXbmMMev7aqRLw+mIv4FFhbQI6ntBu9kbRrAI1tT7wtY
         mpkmUtlEyeG9WyD//4PSfty422POGLhTUG9OHDLf+N6wauK9VVfV7zgJQiVPLsSeGL1G
         MV6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778992568; x=1779597368; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQM4qBv1wE3brKr2hKxWej6MOZp+Tj3Sd6cgQ9f4fd8=;
        b=j1fpPGBQgX3R+Nj9irZkZfTbgr/TJlKiOIRk1UDxrKxPHJzsmADEbEheXV1v1yD1BA
         R57yQIwODn/HXrETqsegsn3nscHYe5UMjzSNm9Zf8eNn5x6E3/q9I/iEjM5Pm9xhDSs3
         vGTuI2Uus4PwcViLvGHwM7cxqUlSfIRRKqclPuDhneKIxpImwTojbXOea79ivv85sveR
         CKMgvF8Gv/T9tkYFGAVnX93nQtv6CHLfABKLLS066EBYShm4E85jQaEoD7PdSGU4h+Qv
         sGchHdQ/1XnMvGggoCJAU/2kivy43X88GzEF3bj/CPvexlsA5p0mKcyKOvbiIUN4dJd1
         RcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778992568; x=1779597368;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JQM4qBv1wE3brKr2hKxWej6MOZp+Tj3Sd6cgQ9f4fd8=;
        b=m9SAgjntnNVa4uZf5tG59ZU06n5zokfCVjLl1EGzEvuDxgKn4xgQ8aXd8kfm3d4onT
         Px9fWNkeA/lWETG4HVmxtRogdnxTAURW1EbO7Eui7g6pnJ31iOXTfftKp86guun5j4qj
         Q01Jqry0GSDTI87ZgACaZ/K3HBv5dlp4rfsp1oH6rHjrdnL35VOpsFbTT7XwiizPL8dq
         d6NpMTRJScKO4oGH5Bt8CLTOCqHOPouUM0yudmHi3EUorAew5IG9IDBxIM6DRb3orJ/c
         DzkRAXczcDczfKoXmXPi3vMsx5QdgGsMJjCSXBmld14eu1i10ivhCgZuQbC9fhtur7BR
         0ZLg==
X-Forwarded-Encrypted: i=1; AFNElJ8JyMyWfsD/szkvWXOjRLyhrB3/halszbXcpamD0OATn5oQMcw2lbJKC4oXXbLmtA287FESZVxDjA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIY4/sr4Otlo3LctegE7hBqIL0zjMok/772ri9dfopmtiWxezo
	b7thRzTKSCdPpMBKQDO94guor7agKH/sDCS/PxvR6lL0+oKRISSJoa0GsBgwAY8l0Gd98ZT9+Pn
	B/UvWFPqHYbUEhtGAeo8idQXyPpVIQSs=
X-Gm-Gg: Acq92OH5gGmGUjLowvFGwup9HfpRD5wAHBo/huh8+pbg6okZGGRUM4VZsBfZx1Ht9LA
	ED7ihwaTK7KwinvCgFfsTk1HxQ8xCR1kpM3lKzkf2Yapd72MsvsH99ysDoPCXz/+a9XXKvWVSa2
	GwLr0od1FFqP5SZfHXN+/H5IeFQKHvNBYlc+j5/EjcDXDBVp3S7zTOiegvBeb/9tvb7eXf7qs2D
	kyGcSrSQ7YfYKSlK3UV/PXta4DPRua97rfIJKryleVNxTNzkjELYcWMawRPM0nVlLYRp4PKpPoJ
	f1snYA==
X-Received: by 2002:a05:6402:4541:b0:676:9c6d:5c59 with SMTP id
 4fb4d7f45d1cf-683bc4b0a51mr3550891a12.2.1778992567465; Sat, 16 May 2026
 21:36:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
 <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org> <CANAwSgSNHO3MNewNzpYbhuj4K3NTdfzDC9KPoUHbFH97P4M_UQ@mail.gmail.com>
 <DHUCL24GMX7D.369IWK9DLPZPX@mailbox.org> <CANAwSgRt5-t_ah=phGc+CQYHG-CdWJuOX-2VTW6xE7n7EnVsFw@mail.gmail.com>
 <aeaXszeaE62rM6BJ@aurel32.net> <DHYOIIFMGH7J.228ISQ7XYFGKE@mailbox.org>
 <aeevr6Zj3Pwm9wux@aurel32.net> <CANAwSgSCo-mESo6=KSc08oUzTWAgzpYu0JaW5KqmnCNiPYHjxQ@mail.gmail.com>
In-Reply-To: <CANAwSgSCo-mESo6=KSc08oUzTWAgzpYu0JaW5KqmnCNiPYHjxQ@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 17 May 2026 10:05:50 +0530
X-Gm-Features: AVHnY4KOL2rGt_SSoRHMzxpCQMBvp_fsFHr614JlPdf6906rsMFKS9vQD857v9s
Message-ID: <CANAwSgRFQiNEi1Ac+sCvJWkj1R+yEPGt0RCjZu-3ZiD0Ffm6Hg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>, Anand Moon <linux.amoon@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuwei,

On Wed, 22 Apr 2026 at 11:44, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Shuwei,
>
> On Tue, 21 Apr 2026 at 22:41, Aurelien Jarno <aurelien@aurel32.net> wrote=
:
> >
> > Hi,
> >
> > On 2026-04-21 16:10, Shuwei Wu wrote:
> > > Hi Aurelien,
> > >
> > > Thanks for your addition.
> > >
> > > On Tue Apr 21, 2026 at 5:16 AM CST, Aurelien Jarno wrote:
> > > > Hi Anand,
> > > >
> > > > On 2026-04-16 17:07, Anand Moon wrote:
> > > >> After reviewing the Banana Pi F3 schematics, I confirmed that Buck=
1 and Buck2
> > > >> Both supply the CORE_0V9 with 0.9V=C2=B11% rail. To resolve the re=
striction errors,
> > > >> I expanded the voltage range in the DTS to 500,000=E2=80=93950,000=
 =C2=B5V.
> > > >>
> sorry I was wrong from the doc below 1.2.1 CORE Power Design
>
> The typical core voltage is 0.9 V to 1.05 V. Actual voltage is
> dynamically regulated by
> the **remote-sense dynamic voltage** adjustment circuit inside P1.
> P1 BUCK1 and BUCK2 must be combined to supply the core rail.
>
> [1] https://www.spacemit.com/community/document/info?nodepath=3Dhardware/=
key_stone/k1/k1_hw/k1_hw_design_guide.md&lang=3Den
>
> > > >> Additionally, I updated the DTS to map the second CPU cluster (cor=
es 4=E2=80=937)
> > > >> to Buck2 to better align with the hardware's power distribution.
> > > >
> > > > Actually the output of Buck1 and Buck2 are connected together, so t=
hey
> > > > should always be configured with the same output voltage. And both
> > > > clusters should be mapped to both outputs.
> > >
> > > You are right, I received the same response from the official develop=
ers.
> > >
> > > Therefore, I'm wondering if an additional regulator-coupled-with: pro=
perty
> > > definition is also needed here?
> >
> correct.
> > Yes, I think this is the way to go. I even wonder if this shouldn't be =
a
> > fix with Cc: stable. This also has to be done for the Milk-V Jupiter
> > board, I haven't checked the other boards yet, but I guess they all use
> > the same schematics at that the PMIC level.
> >
> > Regards
> > Aurelien
> >

The following changes resolve the warning on my setup.
If possible, please integrate them into the next version.

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index c2a1b759d41f..8512c7417f94 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -116,19 +116,19 @@ &cpu_3 {
 };

 &cpu_4 {
-       cpu-supply =3D <&buck1_3v45>;
+       cpu-supply =3D <&buck2_3v45>;
 };

 &cpu_5 {
-       cpu-supply =3D <&buck1_3v45>;
+       cpu-supply =3D <&buck2_3v45>;
 };

 &cpu_6 {
-       cpu-supply =3D <&buck1_3v45>;
+       cpu-supply =3D <&buck2_3v45>;
 };

 &cpu_7 {
-       cpu-supply =3D <&buck1_3v45>;
+       cpu-supply =3D <&buck2_3v45>;
 };

 &emmc {
@@ -248,14 +248,14 @@ pmic@41 {
                regulators {
                        buck1_3v45: buck1 {
                                regulator-min-microvolt =3D <500000>;
-                               regulator-max-microvolt =3D <3450000>;
+                               regulator-max-microvolt =3D <950000>;
                                regulator-ramp-delay =3D <5000>;
                                regulator-always-on;
                        };

-                       buck2 {
+                       buck2_3v45: buck2 {
                                regulator-min-microvolt =3D <500000>;
-                               regulator-max-microvolt =3D <3450000>;
+                               regulator-max-microvolt =3D <1050000>;
                                regulator-ramp-delay =3D <5000>;
                                regulator-always-on;
                        };

Thnaks
-Anand
