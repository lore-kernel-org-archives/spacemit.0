Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754D343D500
	for <spacemit@lists.linux.dev>; Mon, 13 Jul 2026 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954590; cv=pass; b=tPqNQ4gLWSnMgZz4BDxokJ6TqhITVF+ElxB99T7IwKDwsc2iv0ZyTvQlxtj+jGkYq2WVOsJBslVJ6ebMvc8LmpTTRoOB9zcxi0iZMprPEY0iWbWanPpQBwvf7p4zrb9L5CJI5gQU0iaZ4cFlmBClZw1wGZc85iBl+fSyD3FE1ZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954590; c=relaxed/simple;
	bh=HdjriIlxFJNKIiAn7v0KH2Y3CfAyVlV91876yNBmwGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a1JTQ7tKyZvl6Go4SZdaHwMtq3OMTLyruHLBH0AzenhqprI+zHzoNWVz60zsTMXzcAOnwzEmAiURsOLaiPa8LzHKSvTMPEqJvhREQEj6Su5AGy5JjrhRekHa3Ne3tPh7nvzjUpJv+BDHjq+7FCCXDY5tRh7SMgCeigLDfulTTfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=dV4OfFAs; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="dV4OfFAs"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-664d7863920so1269d50.0
        for <spacemit@lists.linux.dev>; Mon, 13 Jul 2026 07:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783954586; cv=none;
        d=google.com; s=arc-20260327;
        b=G7hvpQD3TP/mjpxDzHCmUcqgAUS/H5bcjFvlRsYIJ9G5f4tcbCQpgE1qb6DRpRv40y
         cVZ55DItRTo+btsQI9P0qswbrGLBzX+YCBTmMGFZlXvBNMNHwj7/VBpIftfjklVY20jX
         jEosmgw3YVfrG4lX4v3JFZF80MnlEisfucxaxqfrtrOW0/Aq9RaNB1S/HAOW7euemIqe
         fOwgsdJgI5ZbL73Pepsy6eRftuwaYZ84qoTl1mqsyONUOH6uQIwtoDq4NI/fH7hwB9lf
         87gQbo5xxY+7jawrHOiT4nS1/YF4pHtue5p2yDWzKyfhB+FDqDCl+Xq7rLoJVOs8cIVO
         e5QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8ryOTMNwVpU4ujGUky6ot1LLCqvzzEx6/bFp2CC3uos=;
        fh=qqphierJLOcSVN8DVl1gCzLLwvphr8igKuSXLI1+4/4=;
        b=SXQsPnMNnUCZARabsAw7MbWUAwzjTKeVXBttU3hAgUn9GBL/LN5735+hNWY/A7k+JS
         +/CqqtXFe76dhR/gruI9eVvkCri4nKkdJKnxfM6dpmiyHPNYds89cm9i3LR789qxuh+9
         XaMRszJiEfQt56kbS2xmv4STOI6KK7evJtTv9Q+Ay0FL9/vpA9NeT7AdO4+Zlu+DGOOz
         3+xtUfgQDpD1s6NHf5YcLk7y/SoUpowkq1OjHtkiZ1Kys0n6RJFpKBkH73xR/wxNGLQi
         ty9M+5hbcYosWReq9J3Gq+7UmKmqTOUtnIE2nrKrB9lTuSMz3CLdPtvs+QlUiRVYveyb
         mMMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1783954586; x=1784559386; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ryOTMNwVpU4ujGUky6ot1LLCqvzzEx6/bFp2CC3uos=;
        b=dV4OfFAsL2t9OLjWPDLHU2iZ7WlGbxx+gekBJfp60EmAR6iS3dIuWdMnjEhStIq6S5
         //jpaGJe8qs16+IjPOJaNLO3DOi10fGHGbWuteitGKja8Yr3+CsVEWqh8Nqtdqu/RPk4
         R07krkLjxKfzDxFLq/28ggMvf40I/ztmlbgPj9CaHUkvvqnGGFgXx5U8jVMJKEJQQxtv
         lGWs1gHC0a/CEIUVLKfAF1wzm2se1EnGTT6w1d//Xk7EJkVx+jBPmEePj+VBje+61N52
         EwHt5Q7eEMivuxJv+DSmBRKLW8pEuVpDpGzNgrhGJgaBPK+JgHCWyVG4mKtL8wKIv/0H
         x7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954586; x=1784559386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ryOTMNwVpU4ujGUky6ot1LLCqvzzEx6/bFp2CC3uos=;
        b=oFmrQsvaUBdH6scpRbZiEEo4fZk8w2grPgo+47z+XrJzllLdUeCNtWGWey1pvunCFe
         5CfF5BobqWvvI/Pv974tlgHAAla8SePAGgUO2VEn1Zww6SoSB7fG4mJ/4nLSICNstAij
         reV190IYwsf7ZeLM1PjqIuR3D5zUnMICoU/iGiUN332S+7MPSjsClyBuOChY/x2KYHUe
         h/RUQwOClii6jA+TXzyTfaWLZtjDeWIy/6MC2yTQy8cFNoS3i/3+7WcbKq6Z18/tKzOU
         eIfxr78Aqy38OQrpHZLS6cWVaft9JRNE1vcq2hWkUy5NQByXkeRMDyDgOcrpd/hd5+Ya
         zk8w==
X-Forwarded-Encrypted: i=1; AHgh+Rp2s3gEZu9hkdifADSFApsuQzk+4PcLKzCqYUSENyKogKaKOadxH1M0IFIhzTVQ8xxdLkUID7NKDg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyRVZn024d1mrFFEf2fP2feJHVrAQDIZTJ9pMuh4DAKretatst
	+hQB5h9lAnxCgGIlR/pPUgVLZPDu4j9hLkjo2QXDX9j7xJ1xgyc7wjpUWkAOACcClvjZ2VMUBta
	flBj/6arEQl/xYsZQf2A1q14nTE4wEtBMGiTfT6zvXQ==
X-Gm-Gg: AfdE7clruVfhkrPIBcZ1309d72OmyncXFF+BVXEjtD3SXszpwmt/5r3kcWtqJMY+ZsV
	3P6WPIiD5QryMp0lb5lGqzh/u5Q3OcpQMa6HoJrWQlnTfExArkZ6HJZOPk02QQPWCjvdyza6QM9
	fNLX63HHB+OD9axR835skFmJAF4v4avs5z8JuqxC6pBtfxBbe773rF3Qp4A96yuwNQ5U8+ZBwpe
	IBn84bxkQwyadqcVW1rVZhR3u+v+GP3O2UY04LhrRTP8r2+22EJsTCiPFzE3bSo/2DCPThXuyYt
	Ut1RdC/eJTgIZCgRhkPeZNpLLAw=
X-Received: by 2002:a05:690e:210d:b0:664:8e4e:66fe with SMTP id
 956f58d0204a3-667d7b003e7mr4788212d50.12.1783954586457; Mon, 13 Jul 2026
 07:56:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <wjbz5tp7vjrsjwjaiu3n7du5ksbrlsduuxhwg2wriyxshkrqd5@t3sdxr6ua2sg> <20260713123759-GKD106000@kernel.org>
In-Reply-To: <20260713123759-GKD106000@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 13 Jul 2026 09:56:15 -0500
X-Gm-Features: AUfX_mxXZbxq8-VPSYzKHw4Bcqse0ZCXB00LCsca2IM_XGbO21zHzHAHbEujGR4
Message-ID: <CAEev2e-g3bZcohFf_7b5CaVyi0BeWi5uwLGj6MuhQXp16jiyEQ@mail.gmail.com>
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

On Mon, Jul 13, 2026 at 7:38=E2=80=AFAM Yixun Lan <dlan@kernel.org> wrote:
>
> Hi Anirudh,
>
> On 22:40 Sun 12 Jul     , Anirudh Srinivasan wrote:
> > Hi Yixun,
> >
> > On Thu, Jul 02, 2026 at 02:31:34AM +0000, Yixun Lan wrote:
> > > This series try to add UFS support for SpacemiT K3 SoC, the controlle=
r
> > > components consists of System Bus Interface Unit, UFS Host Controller
> > > Interface, UFS Transport Protocol Layer, UFS Host Registers, Device
> > > Management Entity (DME), Transport Layer, Network Layer, Data Link
> > > Layer, PHY Adapter Layer, and M-PHY Interface. A more detail function=
al
> > > block diagram can be found in SpacemiT website, chapter 9.7.3 [1]
> > >
> > > Please note, in order to test this driver, the UFS clock driver[2] he=
re
> > > should be applied first as a prerequisite patch.
> > >
> > > One known issue is that the device will occasionally raise BKOPS inte=
rrupt
> > > when doing some high load test, log from dmesg shows
> > >
> > > [  806.710763] ufshcd-spacemit c0e00000.ufshc: ufshcd_bkops_exception=
_event_handler: device raised urgent BKOPS exception for bkops status 1
> > >
> > > Link: https://spacemit.com/community/document/info?nodepath=3Dhardwar=
e/key_stone/k3/k3_docs/k3_usermanual/09_memory_storage.md&lang=3Den [1]
> > > Link: https://lore.kernel.org/all/20260630-06-clk-ufs-support-v1-0-cf=
7521d1d0fe@kernel.org/ [2]
> > > Signed-off-by: Yixun Lan <dlan@kernel.org>
> >
> > I see this during probe on a k3-pico-itx. Does the UFS chip on board
> > have an RPMB block on it? Is this error of any concern.
> >
> It's probably true of having a RPMB block, but not used in K3 platform, s=
o can ignore
>
> > [    5.957864] ufshcd-spacemit c0e00000.ufshc: ufshcd_scsi_add_wlus: BO=
OT WLUN not found
> > [    5.963319] bus_add_device: cannot add device 'ufs_rpmb0' to unregis=
tered bus 'ufs_rpmb'
> > [    5.971155] ufshcd-spacemit c0e00000.ufshc: Failed to register UFS R=
PMB device 0
> >
> Maybe disable CONFIG_RPMB to silent this? I've not tested this option loc=
ally

I'm testing on a distro defconfig, so it has this option enabled.

Is there anything we can do in the driver to have it ignore the RPMB?
If the error is a red-herring, we shouldn't be displaying it at all in
the first place.

Regards
Anirudh Srinivasan

>
> --
> Yixun Lan (dlan)
