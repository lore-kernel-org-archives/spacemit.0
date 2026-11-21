Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795283878;
	b=3QS38Kej5Whcft1zfpmW4yYzOz5egXnN1IHmLhsrW/4iILDu5tFRLnU6Y96xh2za9vsk
	 +5mBLP9pmSCAjLZEzvXyvnz84OSVY5k9nKBLZ0fYUtsmT7S0dgQ2j5LtAy3dRGV3fkOrU
	 TB6rO/ixmIcukoAg2JOs1B5QCbjpVtlj+ljTXv9PIz+oR/dJSE4d0Lj1P5IweVOJxoMwA
	 MezB35MMtnUHxyQ++kGQAsi6ggWBd9CVEAN5yTSOo/N6wWlsp/5Cixmmp0pK9KFIxFZ4o
	 THLYwfm/FoK0XP23lnfEWWNUihFBq4aaJ1ydTU9huCCjW+UG2Mj1/RuvTtrWMhkF72A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795283878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9dxaFlJRZuXJMii9iS5rhrUq3M78QjQcIGXNp7AQ9tg=;
	b=DWZeNcBM9cEY9yxRv7KaAja6/ez0xaUSlJAc6g7irRoJIcfr6BnO997mmNOBM1FnERbv
	 h7zrYfsL4+ZYnEB3ANUsQ8jqoxrC32jYVGVV/1UVv5FG5bg6jusSRjOL8l2561tsFCVM7
	 0yvzuyK7kSrWLvC1NNgwXUy4FGTn3to/T6YTp+3T7hmqvWZgY2+YW/52KQw6MVZG52Is+
	 iPDNi+fRDMO++SxaYlFFMeuEROd5kFAMa8ekjSNhBRVVBvKST0CbPVJhwzEuX1oMmH2Rr
	 C+EzXzjOkhjvOzZPaErqNSs5QRDu/sSRDOCeEnnhJJgH1JN5cYhLRDSGQi8vwcBNO0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nB8sNGdZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475B5606A32A
	for <spacemit@lists.linux.dev>; Sat, 21 Nov 2026 17:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 475B5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nB8sNGdZ
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b4b9ba815bso11768977b3.3
        for <spacemit@lists.linux.dev>; Sat, 21 Nov 2026 09:57:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795283877; cv=none;
        d=google.com; s=arc-20260327;
        b=hPAjPkKuPaQJWo70/9qb/X3kp7vjbZ18B4/ZLmlQy8Yal4XXfw7cqZHvWlSfJQY/Xn
         vqmxzZubjkDtf8rz8lhwJEJ7UKakM7Uzqo+tljRaC6Z/7+Dohj/SvQJPVVl1n36gBP1F
         UFnaDnffJ0PT2THdpUi37Za9m/IpMhYkt6CEp+5P8FvP6wuz6QzEMJm9oppaBmOZedEN
         r6y1OTcPUTNi8kdkHr44mGnBxuvxayPPtUTQ/0qSfEPw7GWcjDWHIhQ156WGa1ePtDFi
         HPkNSOOT8G4o0kVH8ZLUZaLW2CNSiQ1rvStTJhLktmlxkFM+VKiJtAw6/tvYzB/1duW/
         /vQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9dxaFlJRZuXJMii9iS5rhrUq3M78QjQcIGXNp7AQ9tg=;
        fh=l9iru6Dy4zjKey0GNxa8O/C8LOqSCfeMehiTImb/NoY=;
        b=eHFyt+0XtVlaxOjbYG6YugIBhQSIIFVJ+XgsQRbL+pIoTr+2qOR5s1nqJ/2IvFEq9Z
         Hp3F7QZBxmTxu7mpiB8nXhMn9GlSmOy7M7+ngUppnMXeFWgWxnaSAzKYmtN6OWoie/Hh
         v74kXPzefbfuidkAjb9NOmi+lgP4H2cJuQ94XqZLg5kEXM58/yyPwPPir9ge8IKYyFXh
         1LwY7hkNq+THTQ2VRjUgz8lFn33kjeWsZnbBNDPkt0aHyjYygJgPLzRvx5PeSflUxedV
         d1oemqTUHIGfJuYR4VwDWLaJRasBrJSg6fGjFj/69jomv2Jywa914I/uBCsfQ8UkrjWH
         tsOg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795283877; x=1795888677; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9dxaFlJRZuXJMii9iS5rhrUq3M78QjQcIGXNp7AQ9tg=;
        b=nB8sNGdZ28wVtg+FppGdU7CUZTMYGEORbaC1Do+PNMVJGBOVSfF/I5K5gdY4Vvedkr
         MxHjWOMkwLBKx80Gfr3e65H/s5P/7WE6ZVScSh4WN84Qf6E+E4k7matVHRrhQBhkp+Ro
         ltWSWFg3hHQedH8gvL4Fjg0Hi5DhULsgiu24SFLfS6nSd5OaDbBGl3cxHsRKCxuLUXYI
         ycI0WP1pPOH/GFHms0uYLDm/OWOTr1ybceLYNo+DOXp1eKD09+B+DN2kYR6dr0LZte26
         pm5rU1X9isPBV44KL5uZIuHPmT6gj9Cy1nFGh+ArjNB/c3JM6b7m6xO7Rau/Y4PWgeuG
         fBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283877; x=1795888677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9dxaFlJRZuXJMii9iS5rhrUq3M78QjQcIGXNp7AQ9tg=;
        b=0okRoLHesEnLpKtU1XOffkdG1bv0Z58wW73vFVLRiGkUvdB2ne4v2tzi73rQFv1IaS
         Py70prOPbDxgM8TTJcgN+LgJii8GobDrrxAai8O/5Czl2sCwOkZePvSrZfHUjyghcoNC
         cXvDClOgmDWB1gCop5Qint9l1s0t+LoAAU+yPniSTkebwGqG7DCQCCn/BBMiK8YmRy1l
         U8LGmfd+CZkppJkWiUx4QNsxYfQ/FLUX91xLAvJjJgb7TD/fOVZAnApb1AQGByJf83m5
         0QT4yD5OIJ46HvE330FOyHJE717HR0mAgzAxcOEWzt8ZIFHRG4L8ICXX1+aoKlBXT4lF
         NILQ==
X-Forwarded-Encrypted: i=1; AL+hErEdYB0TQK7RdevIbVC8l0GJxkUkLb/C599bVgOEp7P+3ncVjQCSW2UgXlXcmo4tsJXo4Q8IbrIsRw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8wxTT1y5yV6OfWhaqMfgztLLgkiihVASis8iBvx8W7f8J83BbJ
	zNOG+m2HDqo869norF8Vvf7q4Y+TUe5YqTQPfwmaPdrgxENtU4rz1QLYhcY73og/BEPI1g7YQ36
	A/Ipzv4D4Eb8OdE7bWBsGOeMrx4CYoDE=
X-Gm-Gg: AZFdTZfvcMLkdWjePlZJ72AgbL9YKOnMojZ+shmZ4fj1s+XorsmTkBS/mdsbhQDtvIp
	5gvwDNUWt0pNEFltjagwodtfphEeXEt5NqUchhV/3O6zXp9l9LD2kvlbmcGLUK8LSRWJMT5Xv3P
	g3B/7KJDU0YSk+agJ3WxQD6pvVsUCepAoVc6HzGwURUvJze7BSixalAVCYojFeqyiAqNdFJ0oJO
	+NIE0GZY748t/AIzXIzHY/NpYHBoDfFpl1G2y5OxZoN3rG/PPqdtiqzLFVz/Ky4VGqWaf+yPV7l
	dRpXvkpV9XKJhCQmECMNXHjgOOpyxgLTFKsRuJmDEDzwKGVUlIIe46B8o7AC6EZ+NgR/niYEnPR
	1I/8TO3cezcn7fjcNczHOVHGOfRRwA3UyZDJ1qXU=
X-Received: by 2002:a05:690c:9b0b:b0:8b0:702f:2a69 with SMTP id
 00721157ae682-8b520500588mr37750997b3.39.1795283877275; Sat, 21 Nov 2026
 09:57:57 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111-img-pm-autosuspend-v2-1-427689f6f2f9@linux.spacemit.com>
In-Reply-To: <20261111-img-pm-autosuspend-v2-1-427689f6f2f9@linux.spacemit.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 22 Nov 2026 02:57:46 +0900
X-Gm-Features: Aa3M54o-NmMelfecL-8e1chO9NJSddT-nsp3zPaudeABWyPskoPrY6_ORqOpIUA
Message-ID: <CAKbEzntsUc4D3Nvxfphy5yApWG+sGsx7VF1cYd3SLSoZKhiteA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/imagination: re-check firmware idle state before
 runtime suspend
To: Baihui Liang <liangbaihui@linux.spacemit.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Baihui,

On Wed, Nov 11, 2026 at 6:29=E2=80=AFPM Baihui Liang
<liangbaihui@linux.spacemit.com> wrote:
>
> pvr_power_device_idle() rejects runtime suspend while the firmware
> hasn't reached ROGUE_FWIF_POW_IDLE. The PM core doesn't reschedule
> idle notification after rejection, so no further pm_runtime_put()
> arrives on an idle GPU and the device stays powered indefinitely.
>
> Move the idle check into pvr_power_device_suspend() and return -EBUSY
> after pm_runtime_mark_last_busy() so the PM core reschedules the
> autosuspend timer and retries until the firmware is idle.

My understanding of Sashiko's point (correct me if I'm wrong):

- pvr_remove(): must power off unconditionally
- runtime suspend: power off only once idle (-EBUSY otherwise)

Since remove goes through the suspend callback, it can now skip the
power-off on -EBUSY.

Moving the idle check into runtime suspend looks right to me, so how
about keeping just the power-off logic in a common helper, called by
runtime suspend after the idle check and by remove directly? Roughly:

  pvr_power_device_off()        /* fw_disable + power_off */

  pvr_remove()
      pm_runtime_disable();
      if (!pm_runtime_status_suspended()) {
          pvr_power_device_off();
          pm_runtime_set_suspended();
      }
      pm_runtime_enable();      /* balance devm_pm_runtime_enable() */

--=20
Thanks,
Gyeyoung
