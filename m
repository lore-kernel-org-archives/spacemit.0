Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5883B9952
	for <spacemit@lists.linux.dev>; Tue,  4 Aug 2026 03:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785814910; cv=pass; b=GaExgkRFzVqyQMJDiipvF+PWRg37lMtr34RKT+CKy9ljDVmfHclsXa+XkFDZhB6uqfgA0jjLlAJLpb7LTrwCPrezXM4Lt2EocLZ3ESA4800G9dOLtrSaKxNFdVXVWedTb7U3wbFfffM4Xb9xud7PqA2gEtkhLPBGD1urT50SSzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785814910; c=relaxed/simple;
	bh=dHJdFWR6LaqfTnhSURUXcfTBvCZBNCAuZVufORAObbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUfbbzTlnVXC8YvRJYkS75Ue7OEnF/SfaFGhgp4mtVyVPyLnUBwl+Xa4lfIGlfCJ5G4PbTekdVmz4uo+R+XZNuSUbSHWpiJn5a0frCPTGCi1TinWIg9cMjP2tN0afEYlqyETykxMsDg0xOHICU2uJQma3BZjy2En/Tze91nv/CQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/Wfx3bc; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/Wfx3bc"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso39700425ad.2
        for <spacemit@lists.linux.dev>; Mon, 03 Aug 2026 20:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785814908; cv=none;
        d=google.com; s=arc-20260327;
        b=UgXPrOVMIDK2b6LgFqfhcQ/Kp2/ZnaTzbddRgHQ+WO+BjRJPxiYtNLb1bOjegxmeoJ
         drE3IQoLVZabXlBxc/pt3Dc+YpDPHJZj7aUdqXQ+KEo4XeEf85t+sYBj7hNFgIDtOCrd
         tn5JCnAHy26BMSB2PIhyMSqK7lUkusRIiPT0FZ9jCZH+6AjsqApzM330QeInb/38pIWa
         SKRSsSmhuM5qwOy9VVH8mjmdBDQBXKAXePOa+LTvPn0ME4mLW8T2+9I7PP4lGfczQnvZ
         orqpGa3aVf7x8OxS1giqGUx21Rrx5Sn5pwsraCSNAtqGgBuCcvVMz2aLrP7LjcBPQDWP
         T8MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dHJdFWR6LaqfTnhSURUXcfTBvCZBNCAuZVufORAObbU=;
        fh=BSiMz2zLuu+z4WN1L7anFTRObDqVKCCAiHnzm7qU300=;
        b=FpIy56TFCT4GllHVBF3Uog3OZzemqL2geB6Hr/3q1StpmCzHCkXz053OTx+B1z0nPl
         L4wmH6cWYtWTWiVTSwexlIcx+qGTrf26RNuLWa6XVTMZvRbCQzx4Fz7pbcSd4wwpPj2/
         PYWTpz5FnKkIMqkTYCBtMd+YyMgkyfWccar1uO+1FTEyZrdgi0lLjUMtUaCjG0MgO57v
         LZLFuJKGXTC4OtYSNhfhdTCFXngim12ATc2rc+pnSR0Z+OPAaMxPLvojrkgoJPMFdzHW
         j1RxIA/+ngawN1YBP06K+XW7ocCOn9MMML1Y+5MdQ26OxCXPAI2rFTH1uu12ZWZUrr0Z
         l+zQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785814908; x=1786419708; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dHJdFWR6LaqfTnhSURUXcfTBvCZBNCAuZVufORAObbU=;
        b=i/Wfx3bc2px6ykiv47TFx+33EV7LQcEa5gHWTo2D6n7dfI5Vtd2Z6/m33y4coXnQqA
         PMrddB6/ZJMAJx1d5rWie/TpB4xl8iXiouW7qV0QdoVpAwfWQ2yj16M3+5HPGLftzzvs
         ae7ET0zWBCS0JJLJGxtLeL+ycJne7OV3gh+He61rCDoS6H5P8Yei7GiHIHybdez9sSPr
         9jpuZA1I8mVUjPiZZ4ws46NfFgHKQy7bZQFBU0HRxC0nkH0F+Nu7Mp/jKguzqBgxK+M6
         ac0T8UxAmIa2cQnp4xMXuGeUdblZY4AnMq5pbCA6yZwNtdXBMdtMMyjHfi3SE7o/RVqQ
         XsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785814908; x=1786419708;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dHJdFWR6LaqfTnhSURUXcfTBvCZBNCAuZVufORAObbU=;
        b=kYbdlkEa59P9lEjEaRhikFM6w8MGC54bDLQdseQ9uVx5zyMOZOqg5Xt49CM0PFLDGJ
         xdVIs46entk8pNZvN60ORmhvkWPiXLXhkHzvKC0cHePRzbHCWaWCAOEsPJZnzzaHNqcX
         1Grswzixtnaj3lP2xxIjcYFpc7Lr+mWJPWkRAJnkikue4M/w9KrygxsEBkJ8ul69d8mj
         7G310VNYUUQyiKnu91HmdPFiTrAYGTufqrNJ8v4ghOpp/Snj7qnDezhuHjVXZQGd5EaP
         BDlFAMj/DcsjzDFT/uJ6DCxDLm3ibibP5P2VMnOWR56pnV07mg8CtBBW+7avXt3L23If
         3XIg==
X-Forwarded-Encrypted: i=1; AHgh+RrNiQoXqKw7+21vk2h6QwUDI48wFR5U22dD1UdAdfItv4wtpQjoCKAPPuwjva/OCKqUTnGwSm2K0g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz62J3LS0C1lpsvXLpBqC4DHU/HPGOh/wJjZRxX/6VyQMmhadmt
	80BRDhbSqN9vI01RQxH7GTfxurhUeUFfmVcutUqmUvysso8vnqYRemYjGG3hNuDDnLwfwwBqspC
	o9vXYwyBv0FfIun5UMeb4ofVyrgVnut4=
X-Gm-Gg: AR+sD10UFjTi6eUsvDv+qPZuEfGgwvoqhTnoJpfJQBFjzPLZygRBHrpx9fPpwDy0mK8
	gQyvdaU4VkNfOWcyuUVbov9/WtmMKA32X2ssdGkZmX4sCb2tTWE3ulqtApNa3Rj9vM16mfAX9X9
	eas4kvAQRBFdaVJkzJ5UDoslRlRBzbYPhDXiRTzqwvFm/kFK0uycguAGwMPb81TfoCvDRXQp+2R
	Pv9PCgretEmdwjLmAAt4sezg7drJW6PFAue9l+p6i1tYr9oiDlBR4KUiL3pdKfaTDFJPqX5Dqqd
	WC94aqrH7kHKOmr6lZWAojRPkSDiOiCL+0CyOq9zZCLkB6WcaugNYC9zfqMOLFIGoKh46GcRb6o
	1M3iA254jgUJzof0857h+k6yKC3GI66Po9NgVDer7rETQmUpIiQDbEvXe
X-Received: by 2002:a17:903:37c8:b0:2b2:67ca:5ff9 with SMTP id
 d9443c01a7336-2d051efd46amr123451215ad.0.1785814908348; Mon, 03 Aug 2026
 20:41:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731101539.36290-1-phucduc.bui@gmail.com> <20260731101539.36290-2-phucduc.bui@gmail.com>
 <DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com> <CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
 <CAABR9nG=s78=5_tGSieN7hdCQOMNzJKdzJo5cx2bMfgAvJM+aw@mail.gmail.com> <DKF3ONLMSCC7.23CTHB22RU044@linux.spacemit.com>
In-Reply-To: <DKF3ONLMSCC7.23CTHB22RU044@linux.spacemit.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 4 Aug 2026 10:41:36 +0700
X-Gm-Features: AUfX_my_ZTitbKpIGPjAOMpa4lAbJZAoEqlQiMARrsgDTH0HTjCNWq0y94hxl8c
Message-ID: <CAABR9nHZgDvNBTT=uKO36+ExC5ozi7mWbS2J-3MxhN4GctpYHw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: spacemit: init *dp to NULL before error paths
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
	Goko Mell <goku.sonxin626@gmail.com>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Troy,

Thanks for the clarification.

> Nice catch. Please follow the Rockchip approach: keep the static
> spacemit_i2s_dai minimal and initialize the playback and capture fields
> conditionally in spacemit_i2s_init_dai().
>
> Simply removing the assignments from spacemit_i2s_init_dai() would leave
> channels_min nonzero for both directions in the static template.
> snd_soc_dai_stream_valid() treats a direction with a nonzero channels_min
> as supported, so the driver would continue advertising capture even for
> a device with only a "tx" DMA. The binding permits such a configuration.
>
> Please preserve rate_min and rate_max when moving the capability fields,
> and send this change as a separate patch.
>

I'll follow the Rockchip approach and send a separate patch.

Best regards,
Phuc
