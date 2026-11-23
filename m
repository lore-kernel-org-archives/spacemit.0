Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.216.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795459307;
	b=X/fkNRSIousw+p4LlctGrRqx9sFQ/zHBINoPOOijBAaqFJPQhvnGCfvRG70qKTVfXSMT
	 XEtni2f9hvu2JC+k3sA1U4GudBfUsdUFF+odg+3Uw/Asp4oCjn0lbza/I3ZyBw0KEofaU
	 8Fz0dZFgrzDS+S8xO8F1xO/RJpTdRcHRulzJo2v1WrlCV1pdH6i8vMNBERlqhQFUY0goJ
	 /S1aBg4V4c5Pyejcs5UMEVLsUFd1IKVEuaZ3FdJbSpAMk6qWKR1WyIUwhCX9aqP7OUfXU
	 h64QlO6f3j9KsO2Y3BdYezIarScLFbtxEB/hJ4mXQHg8qYmOjnGaGGQJWstq78mw5kA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7KCCFV8c12xHGuVa12sa42pR/GvO+E15oZ8scml+fpM=;
	b=qF4trTy1KAeRBRjTaeg1NhXdyZgYBGo6xEcFMF4O+Kb2N6A+RDjllWihAECSRu/swiQi
	 fGJqurPz2IkcTJyDemZMQMGTxHWb3TNFIfQkhuIgJCJ4+NPrFxyXoqQdTrV1EWv/WIzTq
	 XrsgEpwk0FI+Ln7Nbxo7ePYVkGCloICM892rLG3heMQy3uueQrxE/vYmdtDYwr+39tLWw
	 CVo13SelXu9ZmYn4LrUmUnVTiSSp9Y9nxLaH2DA1iUZ39zFikjZ3mPlb4pLk4OnnWoge5
	 ZAv2STPh6KtGT2Ir6OrY5cfNSP1PE2RvDwTqWJPpd68SvQ88XUWTwSGBP+fKz219vhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRHPy5XQ;
	arc=fail smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D9B606A330
	for <spacemit@lists.linux.dev>; Mon, 23 Nov 2026 18:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3D9B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRHPy5XQ
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso2620765a91.2
        for <spacemit@lists.linux.dev>; Mon, 23 Nov 2026 10:41:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795459306; cv=none;
        d=google.com; s=arc-20260327;
        b=bFeReoV41HyoPe3l5WG2svBNdRXIBeEKoahEh5py4DvuUbNHUnyMrzIs1M8JIETL9k
         lBQNaaiGR8RpJPufnzrMzXEzK/gJ66jXBXCiD0JY1utwZDyQ9K6kT8oC1E1PCdgsfbFe
         r22NCOCaFY46GiDVi44rS1sOmm6vuVF0UkFbAhpx/7s6w68aAaDdf6oL8V1+smN2/BN8
         yj5+ph6WNbs3F+z4DlkEZw12rOsgqH/FF5MFZtNOsuHEuUW7C0lMwxlReEf1p8i66COp
         taqjSviBewaJ03IbHFlqcQbjL0HKRisID1sGd0r7oNuDeNrTg8ilfgaS889qnlbpIE8K
         nnHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7KCCFV8c12xHGuVa12sa42pR/GvO+E15oZ8scml+fpM=;
        fh=DRaM4jKyD+0JnGImhShb8ZdrwCxFrECMwtJ+d+Liom0=;
        b=eRIi0oTNVsXaZQKSfdExPZiBnAna1Qv1hsKpyz3hXao5WZ/FAKrmec655hRY11sJQY
         rR3CpfJdVH6z1LFaF7hjBdabdHEnWPsv9GcSzOKZ5Jwa2OMgyUbm7PxPGm5evRvUtJAk
         +M1clkEYNedczf2aBSO2RkupxaydglTdLCNKaYnush9sXa93KOWrmoGE5qt7jnRfNxLH
         4MWBVJg8Wn4xpAqrP16jaAW6lA9NF5z2b4A+z3c5jbJtV+k5Sd7+9rIot0ydXgHQzTq6
         yvwlfisnNH5yVHHH4DF6XVhszLe8VrjGpdWTwQA6lhYEIZZ7/liuVfTLzkS7LrW8/OwA
         a2yg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795459306; x=1796064106; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7KCCFV8c12xHGuVa12sa42pR/GvO+E15oZ8scml+fpM=;
        b=nRHPy5XQdGAyki1Fa+YfUainaKTrsLpj7cQ4e71lJhERhjSw/ZR/pZSzOzaxYI3Yt7
         Q8B7JMg+tITuWhCkn898/S+MGO0h0Vohww9ivBkrm5nKrDh5c2mZSOSrL+V38s/rtyS2
         7jOd5rqM2pdhXL8hwkdjmHqsz96AyHD0XfBTb9O5C+uYZlx+VMVPrjxLijIRpaSDWYQ2
         WE4HkUXQjepp/BWMRRBptoGacOSjwHJnKdR5XT7l4Zw+spqCEqtPK2rbRNFg+2LVuvvh
         gjmCb37Bj+wSLXx3Enm6BnNk/+5hBwXRAxdL6ZVfc0lBD7Kjz9w/7HPylMBXw4tkSTDy
         uNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459306; x=1796064106;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7KCCFV8c12xHGuVa12sa42pR/GvO+E15oZ8scml+fpM=;
        b=2nTw3LGsB+hHnnQzh41JzjqemE4gw3d2D07JsgKSdeOEJChsDYWgZm/ttLZbVm0vFN
         7H9+M7xp5S8/kEnjk+U2aoDIuEeyA61ecN78zdhOxWdCioqaCi9VdaxL8413J2i7a3p0
         ZD7VS4Aqqr/UN1ySbuiY8fRcfgs08oK8BCVsVj8P3fWO2EGYpPNdKikaYPZMh0W9IzMT
         Diciuzq+KeYu3Hip6MiWXgreqQYNShks8onQDSGJtuwPOd+Pjg5+muvJDMPUiBR3nzlv
         XZo37WFQCH0vhx6pqz8+5lb6P1yHmvy2F4rzHHiamBF+eZcTMvo9bXdRdMgyIyT0P1ak
         +NWg==
X-Forwarded-Encrypted: i=1; AL+hErEYe247dvNyPi2UagdFpu1F5PdSi1WpbiU5xsEK8CkpLmmCL95r6il/D0y4cHYWerWLYzAenjhAYA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9jLoUo1Tc/s/7BHMaSIfZjxcnPD1kk8XZ3f4/yz5ck+kXsQ45F
	VWIkW+3+fjw+tRKknb1fA4ndm0dkEC2Oa49bj0iIDT5hJyIpIKjHdTAE/5INraEcrk4vV28zLMI
	/EDC3hrTC+6aysC1BOROmrDxTVMXqxd8=
X-Gm-Gg: AZFdTZe0vGAmXb3bt/Sng8i7ilAo9z2nPbIp4/FR5mYdfmgAM/Zsrge2EFVJCHyt2BN
	ycXxIVScuri17mVXIVquP09+L2o6UKPWCNopf3vEi76T/2n9AqPVzAxXEnyHSS8LHE6TBVkogF9
	yFCmKg42beWGzf60guRShFegPqBntwQbiT/DMi89Kr5kEnYZSwUuIdB6yvq79iyBxPL65+WeFT+
	V3w6zfEuP3RUjYihxZL0ruGzfFlUVr/tax+j4thm7IIUqCL4FIt2sSGWGcelo178SmuZCN2LZzz
	9UyJT1945UTCCF7q4JeXxQ7fc5mC2lGdJtL7omDotObKbLQ8Trx4++MvLQM9OCXrhwz19O2JrJl
	fLuitKQTeK+cKazIzHQjuyYGshpP5FpoLRpZ0oQ==
X-Received: by 2002:a17:90b:17cd:b0:3ac:6fcf:91d2 with SMTP id
 98e67ed59e1d1-3b41c8fe3d1mr11633543a91.19.1795459306227; Mon, 23 Nov 2026
 10:41:46 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com> <20261122184434.545341-1-frederic.mahe@cirad.fr>
In-Reply-To: <20261122184434.545341-1-frederic.mahe@cirad.fr>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Nov 2026 19:41:00 +0100
X-Gm-Features: Aa3M54rYymnQncJINmj7PXylw19m9Q_Z0b_H3MvffZyCzTJDH31b-Bzjr4MRK-U
Message-ID: <CABdCQ=PnfXRd2=b6_yEN94RCRvPnWx-WFfHZDC+jhHv_UFZ1ZQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: add PowerVR GPU device node
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYWjDqQ==?= <frederic.mahe@cirad.fr>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Baihui Liang <liangbaihui@linux.spacemit.com>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fr=C3=A9d=C3=A9ric,

Thanks for testing this on the BPI-F3!

> Two notes:
>
> - On v7.4-rc1 the driver refuses the GPU ("Unknown GPU! Set
>   'exp_hw_support' to bypass this check"); with
>   powervr.exp_hw_support=3D1 it works as above. Is a driver patch
>   adding the K1 GPU pending somewhere?

You're right. I forgot to mention in the cover letter that I was loading
the module with:
sudo modprobe powervr exp_hw_support=3D1

I plan to send a separate patch to add K1 GPU support directly in
Imagination's driver.

> - The GPU never runtime-suspends: after 160 s idle,
>   runtime_suspended_time is still 0 and the power domain stays on
>   (autosuspend 50 ms). That looks like what Baihui's "drm/imagination:
>   re-check firmware idle state before runtime suspend" fixes.

I hadn't tested runtime suspend for the driver before, but after you
mentioned it I gave it a try and can confirm it doesn't work properly.
Hopefully Baihui's patch [1] will fix this issue.

[1] https://lore.kernel.org/linux-riscv/20261111-img-pm-autosuspend-v2-1-42=
7689f6f2f9@linux.spacemit.com/
