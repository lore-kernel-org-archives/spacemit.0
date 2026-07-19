Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAFD37F732
	for <spacemit@lists.linux.dev>; Sun, 19 Jul 2026 23:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784503222; cv=pass; b=uzCah3jegGYNsssxL89+/ffjGRjv+jniefBWp2x1rabKqWgdkqSKe74vDLMO1qxW0jf9uNYy9ndRU23ZaEZlh5HiCNl5sdU9oitOZus0KQytNido421k0rPngm8LM1MuCcNXJCJiOe+UpcuWx+q73TBWNejzPYb5arwCI7FFa3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784503222; c=relaxed/simple;
	bh=DWT7/MJowsj2WV+e/BvUBOitlHcs+O939V9MzG/T3iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t1OQL78HSqhnrOe8mzRDK48pxiKp3Pa/LBBfGnJarOtvNsiNZzAaNBvdRYwwGnMVv+qvRSFMrSN7G2W6FJzNX4oooCFlqb44mMipK5nzhGeuPxFYCBWJXc8PG//Isb1RW6tELwNONeAP1OPcilyA+xtzQWc1D/N/W+bF1evx+Fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=DE5B6wmL; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="DE5B6wmL"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-664db84f074so12752318d50.0
        for <spacemit@lists.linux.dev>; Sun, 19 Jul 2026 16:20:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784503219; cv=none;
        d=google.com; s=arc-20260327;
        b=Eon6DH1Q2VFGAXlfFbC7e5exqy8XuWAqlAqymrR7G9nF/+nIf+8QTk85uQL727KUiN
         SQCFnwWVXJoDBPtOj/7yUiunAaJracFQsEwrrLVBNR9wWQBZ+l5QdXDMxvcfdEutIP7b
         91IJITSp+09v0hptn/FrZlYcizt19bx4LdWaoRFrHLJHpX48aTI15+oLql/2RWpvdEj/
         grsEzMP0xSGD1+Foe85vhWPIWI3iam7LQ8Ur9/aIHakviD60IyP4nDywAxM1CWP16m4S
         UpSzSo+IjMHtEHZ0jo57wNPp4xNdJBi4mjrPM+iwk3kIPiXe+vw9V/Vf6tqja0ujdh4e
         8hxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UPqjPIJbJ4hSMkmX6fzNuKXuPBcJE4+S9+cyMi05hk4=;
        fh=yNVKJR2aBspSvIGPwg9HtQ89tDUbU5y2tqmoGo1H524=;
        b=p2EY2nKMmcQ50Bg6O2GT+COzol75XVWiotnBx7Ne9Kka1I+d5ZgVMtmMMWJfiKRaV3
         wCPACB4U0wpk9eYQw7+zgCmr7DA+pvfj35QsM3N7LQM/T04ObCrXDUqoyZBMZVbsXayx
         bHnsTuHXtaHPPAJypHKs3BpmMPbI6m0XdKGy6ODHZcyDg4EAetiXzHbGzLuvBHsYSeBo
         oC1PO4Dum21Xcwa80sG8yZO78x4rXbIJNSmiYV4lL5H6TvhdMDtk7mJEhLmzefzaSCPF
         Pjf9QCby5Md8zmjOhvKeB6lqX3nWwYBU4HkHn2Oqf8UOZJ5NA2i5g7TM3xanllLUc8f5
         wn/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784503219; x=1785108019; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UPqjPIJbJ4hSMkmX6fzNuKXuPBcJE4+S9+cyMi05hk4=;
        b=DE5B6wmLU7JTYad+2s+UXz/C5TZtS+HjgwsHQEBPe94WAUjOLDMT95Oq7a3nzdflZh
         vl1Uaa0ARcPbFYCvGLrpIOljTmXeGwWVpKBL1iBoeCZ7cQ/XiN7jOGuus91QsdESUN7V
         5N4rjdqcNcqjhcmPXQzM17RK6XlXCoAvakBTg/liBtO6Ohppe7C/sRsVmlg/iAbAr0+1
         RbQI9IozkRMHGrfIrCZ5wBVcIgVrMzuT8cGbvzjF3+2EzbhAY/RwgvE97YeCrwFL6KcF
         sycXxZrOaC8NC5GADF5R2Y6RL8oisKUfhW1r62dNTIE98oz7GIAgLYmzjfdnmyL+Opug
         KDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784503219; x=1785108019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPqjPIJbJ4hSMkmX6fzNuKXuPBcJE4+S9+cyMi05hk4=;
        b=lpK50Vw44Gga8cVwdwaSOP1Ko+uBUXuEZEKDARyJ9tomRaOSa4xKZiRG9/J1lHnyIO
         yEt2xeg9ec4KkRC+IoUrNoe6OBE4+oe3asJrB1rHbf2NmgM0Rf4dS0z6p71i2D/F/iWT
         eUehNhBi7G/DdjgzTHpjkyRbRyqQw5T4O0rnr+8IfiEGxLGmlaY9DqHuYV6MzWAEq+5g
         1iqYPy7BW4GDwUguTsRC5Gd4u72kibO0c+ENtWBdSUn5Ms1/Hy54ZGYEqV5xUbhYRSI4
         As5Md90VTovwHlzSKwcS715CyfNLcIgTmRCIPwdAUgebeOsEEfizH8TAQzuJI7OcOQ+s
         2WIA==
X-Forwarded-Encrypted: i=1; AHgh+Rphajlj9+/mN7lXnTTaXIIc9zMhLrwBj7hbP3aFDLFi3M+aEGnniemtbCYX0udh+uKPLe24kQyo8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUNozHa6K9hYlmZAhBEToGl43wNmgD3HyPwd2ElBsWk74PY28i
	atFI0mjzOMgbINDaV/OcPJobRx7Cwaq6zP+okOjAEBuCmTcfq5VIWTCOSkyieFEqLkxcnkIUG0s
	FpKt7arc3sVwUmS2sO6oX/3qE7N6A8lT36B0oA8H+og==
X-Gm-Gg: AfdE7clNagK/xgaQ66p88xzC67YyB4PV/C2QypbuK4h4jXHzpZHMirebqdVU50q8Kob
	6nLP3CpvsNtIPYF8HjdMWvv9gWTqb+sXzAvmbbofFxfUswb/5gx5O8SycHmv9xI4y21UXxaZpOd
	fRmRHzopu+fmy/dhvEAPdApHrMCVLfTG/mjiwm1hnD79OftaJNR4msSwJZOnQvJoM734VorqH4S
	X7l0VJ47z6CcsWm0rSDmZm9WejGRzhHN8igLRxlWUmZfIgHX60hgBVx6yNtuGAaNeWM+jq61VLH
	6Sk0NfXsQwtXD4yYB3CtLl77jE5zDHCprcOVEIgUczmsetmZM6s=
X-Received: by 2002:a05:690e:2504:10b0:667:c15b:dab6 with SMTP id
 956f58d0204a3-6683be6aa35mr2695296d50.95.1784503219030; Sun, 19 Jul 2026
 16:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <wjbz5tp7vjrsjwjaiu3n7du5ksbrlsduuxhwg2wriyxshkrqd5@t3sdxr6ua2sg>
 <20260713123759-GKD106000@kernel.org> <CAEev2e-g3bZcohFf_7b5CaVyi0BeWi5uwLGj6MuhQXp16jiyEQ@mail.gmail.com>
 <20260713235742-GKE106000@kernel.org>
In-Reply-To: <20260713235742-GKE106000@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Sun, 19 Jul 2026 18:20:08 -0500
X-Gm-Features: AUfX_mxUPpHWs2hIHbiNCUZT8v6smWRhuvoQSN4l0SVoBHHrNzCPKAS_FyVfPXc
Message-ID: <CAEev2e_hmQBrk3Vfv4WmeH+ex_gMwW_9mgNKaUjFaiCScxAqTQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add UFS Host driver support for SpacemiT K3 SoC
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

On Mon, Jul 13, 2026 at 6:57=E2=80=AFPM Yixun Lan <dlan@kernel.org> wrote:
>
> Hi Anirudh,
>
> On 09:56 Mon 13 Jul     , Anirudh Srinivasan wrote:
> > Hi Yixun,
> >
> > On Mon, Jul 13, 2026 at 7:38=E2=80=AFAM Yixun Lan <dlan@kernel.org> wro=
te:
> > >
> > > Hi Anirudh,
> > >
> > > On 22:40 Sun 12 Jul     , Anirudh Srinivasan wrote:
> > > > Hi Yixun,
> > > >
> > > > On Thu, Jul 02, 2026 at 02:31:34AM +0000, Yixun Lan wrote:
> > > > > This series try to add UFS support for SpacemiT K3 SoC, the contr=
oller
> > > > > components consists of System Bus Interface Unit, UFS Host Contro=
ller
> > > > > Interface, UFS Transport Protocol Layer, UFS Host Registers, Devi=
ce
> > > > > Management Entity (DME), Transport Layer, Network Layer, Data Lin=
k
> > > > > Layer, PHY Adapter Layer, and M-PHY Interface. A more detail func=
tional
> > > > > block diagram can be found in SpacemiT website, chapter 9.7.3 [1]
> > > > >
> > > > > Please note, in order to test this driver, the UFS clock driver[2=
] here
> > > > > should be applied first as a prerequisite patch.
> > > > >
> > > > > One known issue is that the device will occasionally raise BKOPS =
interrupt
> > > > > when doing some high load test, log from dmesg shows
> > > > >
> > > > > [  806.710763] ufshcd-spacemit c0e00000.ufshc: ufshcd_bkops_excep=
tion_event_handler: device raised urgent BKOPS exception for bkops status 1
> > > > >
> > > > > Link: https://spacemit.com/community/document/info?nodepath=3Dhar=
dware/key_stone/k3/k3_docs/k3_usermanual/09_memory_storage.md&lang=3Den [1]
> > > > > Link: https://lore.kernel.org/all/20260630-06-clk-ufs-support-v1-=
0-cf7521d1d0fe@kernel.org/ [2]
> > > > > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > > >
> > > > I see this during probe on a k3-pico-itx. Does the UFS chip on boar=
d
> > > > have an RPMB block on it? Is this error of any concern.
> > > >
> > > It's probably true of having a RPMB block, but not used in K3 platfor=
m, so can ignore
> > >
> > > > [    5.957864] ufshcd-spacemit c0e00000.ufshc: ufshcd_scsi_add_wlus=
: BOOT WLUN not found
> ..
> > > > [    5.963319] bus_add_device: cannot add device 'ufs_rpmb0' to unr=
egistered bus 'ufs_rpmb'
>
> Just checked code under drivers/ufs/, and couldn't find where ufs_rpmb bu=
s is registered,
> so this kind of warning/error message is expected, or could UFS maintaine=
r confirm this?

Seems like both of these are bugs with the existing UFS/RPMB code in
the kernel.  The dev_err("BOOT WLUN not found") print should probably
be downgraded to a dev_warn. And like you mentiond above, the ufs_rpmb
bus doesn't seem to be registered before the ufs device is probed.

>
> > > > [    5.971155] ufshcd-spacemit c0e00000.ufshc: Failed to register U=
FS RPMB device 0
> > > >
> > > Maybe disable CONFIG_RPMB to silent this? I've not tested this option=
 locally
> >
> > I'm testing on a distro defconfig, so it has this option enabled.
> >
> > Is there anything we can do in the driver to have it ignore the RPMB?
>
> No, but why not disable CONFIG_RPMB in the first place
>
> > If the error is a red-herring, we shouldn't be displaying it at all in
> > the first place.
> >
>
> Either fix the code or just ignore it..
>
> --
> Yixun Lan (dlan)
