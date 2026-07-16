Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B0B3D667F
	for <spacemit@lists.linux.dev>; Thu, 16 Jul 2026 22:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784240864; cv=pass; b=EhtvsgcmOchTa2Mz/Z741IxRxBpLhiQrY1FnR0maq4DBjpEg/CKzbYSSODei83FhIAwO9VPax1vLlZ6ABBNnRqZMi04c8ME33iZt2gx6Fsv6+czkIQypwRiqRAsY8Ft/YwKVl+6KA2eo0gUT2kiW/fdkliWGyafSJ37fb3URApw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784240864; c=relaxed/simple;
	bh=6ZU0yywrvxPHG6hK8bj9GpWMCRYihvW5KONWikHDtR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JKSFRA0tYLljhjg6PXpSelyAGzGYXeL1DNE0M5alNteHZCdkWXZu8UQC9RT85wzECiSxTuoMp70qcga2HSBF7av3QmtNCa1Z+wPI8rHxEPy0oHJnEINSLDUqy/NZtMDeRJKgYSO8bOjPqx0M49DvARE2h6csWLSWk3epg5xogAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=RZlONvMK; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="RZlONvMK"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6682259cae6so2095349d50.3
        for <spacemit@lists.linux.dev>; Thu, 16 Jul 2026 15:27:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784240860; cv=none;
        d=google.com; s=arc-20260327;
        b=fEz/DgKJ7a9Rc49IPRsEt7otQ1QMc0J/P6ft0zavwvVbq70ftCeBG/yYfuwc4FvjIJ
         9UK1LbxsE9QkCsnSyUSLvUeFxIjCuNiX7h3Xvb1idOfVpfYlYqsVQKdRYrfdTZlTeUmU
         LhbMTzW4mc6RUjIabpwOnMiYLhJZi1K9K7U7ZEeFVr+6EKz2KaijIUts3PtKkvgyihrJ
         chyqVmGdtSmRfTwucvQnb2DRInjH8I/9Er7TewbUmYalrAYqSqGaVNMHyjXkH2Xkwu3b
         w+fEWdcZra2ho02xiyMTwIR/N3P0MH9DT0ImrHAPZkKqYOe7RaisriNDlrfGSJA8qLKM
         ldyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ZU0yywrvxPHG6hK8bj9GpWMCRYihvW5KONWikHDtR4=;
        fh=nmJ8SSdo1AADfnIiLmdecd0XySkK9bf1pqNhCxqi6IM=;
        b=R7YXpOYYT9Qfqz988YfbXtdw3pe8mH5607HmQbtstxiRC+LdJ9nPELUXqfy+HGYSlp
         E3j5EoJJEkau8Q1lx0Qy5ov4r660dTNq++Azx99SVpYD38NloswFnOOvFcCQAYfSemj3
         bBzd0TdXo9BydOGFBOS3wufyEztNJa4CCQ786ucCExUFTFOeHfgUzoO0r6UQ2PA21tmp
         9yrwyzJ6ZyudubCKgF5Q+Wguk2ErWF336ep2L77Mj/GJAMdFl7tvn7KBKtPIyoPBOXrI
         lRwC2MurEdFqcmykQ0q8GIpqA7kDYeW20OarWrXud7ZCYUK85BgOT2c3KlTkiWA/HKHh
         G2Pg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784240860; x=1784845660; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ZU0yywrvxPHG6hK8bj9GpWMCRYihvW5KONWikHDtR4=;
        b=RZlONvMKax4wDVoM+IWKkTBDqBpyL0NwZj4DIsdwqiXNPlOTHD4ApLaOVEiHB/9sQB
         DsGWp8aXQ1FsvRmeCBRC2ZFigUHwXO+FAR/gQTLGazcLVesrfPnMlJ0PPVq480S1Bi5i
         8Rdjce6UUFbPp1nWNw1RfxW2F8xNl2QJ5KnuYkosZ+9WDYSoKUY9QTfa89u9Z9JxSjD6
         9gMkiLPFiVM+4R79AHW3XDCQgXIY9MOX0JbMC0C/sKYc9B0VKcb2XSzKBs04ENCHdT5Y
         +qgrbWtVnIybfrvrAmp2a1Bje/t8KrODl6GfoVHCNPaGfCgPpLjG85u4GRXFou4OQaM1
         mjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784240860; x=1784845660;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZU0yywrvxPHG6hK8bj9GpWMCRYihvW5KONWikHDtR4=;
        b=BuLQ7YIx92JHboMZImR2fS5VecjYQ9k2UcRCEbWINHlZvnGDStxmKBiNCKVT0bMLi2
         eosYqyni5E+sY0NA+FX0hh6DRGQEGbQVqqPU7cWWOSoX2lqubxVYTb73Nzkm7q3NNIzS
         3f+T1C6fKPtXumzwo8OKusfNBJ4aB+kda41a/qMttPM2/Cigymu6OhOJ5X3ksCTrSGdG
         fcWyHUDDsmUclJUEBq/lVyWUFWKJrk4DKWIOa6r6pmPcM/sUnR5yQgj6zILVGrXwaNW3
         FwnQeA39v/UBnPievmJG5OE7HQ6LZv4uJt5VDD2IODJdaPV/LpyYW251ON4nD4rYH3ud
         v6Hw==
X-Forwarded-Encrypted: i=1; AHgh+RqTVA1krgb9Q28nPeCGjLHmtMEtPraKiP3qZ/u4DMrIyZiZmNTjZamQd/h/WWmnX5fEJqL8OOhtRg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi8SKe7qcrer/oLHbtkg3K8bGpIM+m8t9Ba737W/TSekRUzjW9
	bJQu77oirPSNo+r8iIcRPYj8w3Fm5mu9F3QIj8hEe/6LENtVYElnnyGYvtdE9vJz575FEI3GNxC
	RimW+tsIdZsK8zHSBlLBq5b7QRQgOxs9Gqb+CTpQsCw==
X-Gm-Gg: AfdE7cmOOiAP22uOYmDfXHu4tKE/ms2x3vgCuoXZdrh6SzhWHZlpD6Z/xlvuljqkTqR
	4aUdkJzdX/09w/Uf27opz3jIU3ZkFzNIu9qpHAsTg5eiCyUfdejBZxTMmpABZ9yl0NGHjvw6ezA
	GvThLOgGEmJtaDXuQQbgH2eDKaldmS/TvxVgnYqWP93245bmsm9cnyrS2ExYmTk7cqwbbAYJbrL
	7CFsl6M0iiw+iG+RGsVb4/ccg5UjiwfUA/XgNwXAlkm74hcU1YtdTNi6OhTnImN/jQ/MkFWbcaY
	htkRCQ07cbX+0bEUyQ==
X-Received: by 2002:a05:690e:4292:20b0:664:ae6b:b499 with SMTP id
 956f58d0204a3-668134128f7mr5521399d50.78.1784240860157; Thu, 16 Jul 2026
 15:27:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715-rtw89-spacemit-k3-v1-0-e577bc63706b@oss.tenstorrent.com>
 <20260715-rtw89-spacemit-k3-v1-2-e577bc63706b@oss.tenstorrent.com>
 <e7a43955e41c4dbdb864e89edc3d9fe6@realtek.com> <allZOmTRIvot39Gj@inochi.infowork>
In-Reply-To: <allZOmTRIvot39Gj@inochi.infowork>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 16 Jul 2026 17:27:29 -0500
X-Gm-Features: AUfX_mwxPqzyWp7O4WLTTM2K_5Fn9GaDNvcy6d1xA8kFX3CnozHTqWZXOkjwN2k
Message-ID: <CAEev2e_QaaGmc-fSd4dWQAm2YOqOmBDn-xi1coWrAnoh0JUqRQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: rtw89: pci: enable 36-bit DMA on spacemit K3
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Bjorn Helgaas <bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"spacemit@lists.linux.dev" <spacemit@lists.linux.dev>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Inochi,

On Thu, Jul 16, 2026 at 5:24=E2=80=AFPM Inochi Amaoto <inochiama@gmail.com>=
 wrote:
>
> On Thu, Jul 16, 2026 at 09:22:17AM +0000, Ping-Ke Shih wrote:
> > Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com> wrote:
> > > The Spacemit K3 Pico ITX Board has a RTL8852BE pcie card behind a PCI=
e
> > > root port, but the SoC doesn't have any 32 DMA addreseses which the
> > > rtw89 seems to use by default. Enable 36 bit DMA ability that the dri=
ver
> > > has when this particular root port is detected so that the driver can
> > > probe on this SoC.
> > >
> > > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> >
> > This patch looks good to me:
> >
> > Acked-by: Ping-Ke Shih <pkshih@realtek.com>
> >
> > But I wonder how this patchset goes via which tree. I'm happy to merge
> > them into rtw tree and then wireless-next tree if people can ack
> > patch 1/2.
> >
> >
>
> These IDs are from my patchset.
> https://lore.kernel.org/spacemit/20260709040027.958400-1-inochiama@gmail.=
com/
>
> I think Anirudh can move this ID and add them to the pci_ids.h
> directly, And I can adjust my patch to depend on this. It still
> needs some improvement to be merged.

Sounds good, I'll drop the dependency on your series and just have my
series add these IDs to linux.pci_ids.h. I'll send out a V2 tonight.

>
> Regards,
> Inochi
>
>
