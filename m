Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793464501;
	b=h5aCX+EOSUhTVoSv2c7WQZQokATzbo9zULzYghXqwAtjp4EaHPXwJMrbJAc5nUcLgaC2
	 BVZGA1v/aghw9CYmPK1QOud/qSeC6+0FjSV6SqEbSTASBTemExehRFwjg8VZ12MveHrZU
	 4H4FIBsgDsi0oClePDNmAc+21VKGCA/8NSlnlpOZneH0HnovqKJCvMKiIxET6AzP87+9z
	 F16AI75e2HT/3BU8/XOUiWzvihYGPLE3LhpbvKL6ED/WYAFx4eh3HtghLJw2U2u4jrM2T
	 dXzyt/oYojBeop424mczSW3IohorwTFhf6pigE0PeIzjXLE6mYBV/EFXby6Yt0+XNXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793464501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xh4+zw2NsvluCtokX+uj0ZJ8AJtCAX02SKccWbKLLC0=;
	b=MhUQATHsrn1Mqu/8P1ptQXaObzO1jixV+bT1V1aXs9mEEXkoz4+RR9fDjo+KzyXc+h0K
	 l+plimo32mHtIiJaEwDdd1zD/sUmVfbTnVoHBvfAnHK6B8Fx4qSTp5m27eYu2/k4CyF8R
	 RkNhzNXlc53UIFNapQUZgwxGTyg8lZPdLmiwQky+VzES3T2zdbODNwHrqVphk/Mge3WLS
	 v5REBZUXTmJ8xcIfwcIP0p9BlXfPKdww+RLVzdEHJRheoX4ngZCUmCccNCgWrarVW9L3w
	 J/AI3/tbMZP1/FBM0/NPh8VFE1ml46jMl5v8T4jff4Ul/IKe9KYQBgKp3RMpV+jkIfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CcYTKHd7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304F7606A31A
	for <spacemit@lists.linux.dev>; Sat, 31 Oct 2026 16:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 304F7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CcYTKHd7
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67a79750749so1023564d50.1
        for <spacemit@lists.linux.dev>; Sat, 31 Oct 2026 09:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793464500; cv=none;
        d=google.com; s=arc-20260327;
        b=fJh3WcftPlzAEr0TQx4kQo5DbkvZKI3wnRLz1biI36Jw+yu/gd+v8YAfsLtyoAHR2E
         lgyM4B/JzUFSygWeMBPFCHWP7mi4/+CBfuQRudlewy5ApsUmk+zu6V8Z93BM+8o45Sk0
         8kQKwblcu760Xj7bM3iZ+I9Zj7cNHQ+R8muacM/LqmE0EnLEgk9Yv3Apj5qC4/bt9j0c
         Kwq0H3DePVxet0/qIs/T8kBdIZXto9vV+JAD+3YE5apJfen0rPdZI0gYJ3bnpqMKdhur
         cTM/lvTPwp0yxZPI7pYUc2XWgLIA03vJq39liPsVvAPs48/2u4WCd24x2caGPEuagEC7
         D51A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xh4+zw2NsvluCtokX+uj0ZJ8AJtCAX02SKccWbKLLC0=;
        fh=r94GiPDmbhwIdJH5RzIr0kswKEfO0OI7b4MLgzhCdtM=;
        b=Q64pNOmzo0ycr3TPZcuABymYHw7+Pvam+H2ggTKaVyjbvMY10L42eGfmc7tIflzAkq
         +h626Ye/eAuY86CBUCbOrgsOW2xRhOFFQC48atp/lb5lHNDW95Tf5edUGsLCtypTyCFf
         uh801QLQHqQlC6JQV6NFwt2LXxtwipF/78kuAqcX7WGnMLL++xKbTfEO7ykRMASGhMOX
         jpUSiXY2VGy9w43eTHFz8VyCCzYRkoKSeEVn29wFTqpThgtZGaN3FL04xX8HiibseX5x
         D/bYSYT7tFnFOfq3Nr44b9F0s4jp407mcAmRYzJCkm0LH3UDaAMuAjudVIObRWzg/tJb
         eGBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793464500; x=1794069300; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xh4+zw2NsvluCtokX+uj0ZJ8AJtCAX02SKccWbKLLC0=;
        b=CcYTKHd7F4w4QgpyEF5SnuwY+dEHcR0IUFK8L3Fj/ZZVRx8hMON5BbaRTK0RlQqiMa
         ceW9cXPkjA1Vbg/vDh4T3v/7k9fqVQTeTx11r+LKc97NjxE1dvdP7AaIJHS5W5U2p1GE
         62B3TwnF3SaOjNzlY4yXmU41e256Mp8AKLgEemZ3x2PIsehz9TYLBSIdzvMja4c5osXf
         khOBciEoJyH5E+3AOL72+IekpngPGuOh1vQr7NtDNPAL/svSf2bPwukWU3R+y39XIDNV
         /Ru+Ala0hXgpBcOIOXrVPlYAp0Jg1wBPdQ6WchzLgtxvW/jT5oeQH0jje+yYhpM7FNzc
         kH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793464500; x=1794069300;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xh4+zw2NsvluCtokX+uj0ZJ8AJtCAX02SKccWbKLLC0=;
        b=LKGW8xM2T/NqGOByBm4CGM2KCTGg+68owwZH5bDnrQi2WIWl5Uvngl4Oj1PHu0JbG7
         lW6oVv5Ze7n5IQNa1CLcKNCOar2Cvq1EkxWwuL0zGhdubZ0fhDIQ+rd9htRLH08YYX6k
         4uDK8vOCQkEQZPbJAezvwbwrKnhLxg4t4WIxCc05TRD1Y53KKUXm8zkO6KBgZBML8Wip
         jhgnkpRuNiaP9FJa0oMx8lNGHFYhpAwL96v2RQ0JnTnVK3u6KtCuqRsVNDSUpEQN7Oh5
         X+DkWpfjgmI1g8vn8bUdw2YrWHcHJCdBmdu4ntf8cG0C5iAGEpyZ4N60Fy2e9PFgkjdW
         7qlw==
X-Forwarded-Encrypted: i=1; AKwUvBxGePPXhsHI90S7jwEiMyA6xPq3GUV8JJ9qsBRiQexbCa0voFsf/yPADpQCrbYYWW9tNz17PmFs1Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z/1NRDD5LbsrhvWVs+nIPsNUJzhZNz1pEDrrGmm/N2ui4JKUttE
	AhCajClCAka0YY9/0HSAhsdkXrW9O2WND8Q2u5MP5JVsfA3kbu8sIJ0ie4wCO1KH8TctIBjjTTz
	VRzD7T05VLBwEp3W/DSmBSwXpnXtduCk=
X-Gm-Gg: AYBFou0ggIlHqArqNY5xk9N6ptQMhQpvxUZrSXVEsjouJil+lMpew6hTLOt5W6aZMci
	fLYJqDFXeOMIus7bMakVt150RjNYpXa1htTOwRy+WimgVIBZhhTz89rNtvMOvVPyRoDo+TCmhLj
	t+BTFRK8fDdAZ9PKWB7qwXSbhXz/AkJPMcqGZQFVBmGTWqtUOe4uDRtPndPA1WVN+bs1ZY3BhbE
	ZEkZ4mgOkftSmEKFs3Lf0L21G1CvKTBWDC46vzntpzRyNUv2+ptFAJwT3GdQbkkP3eD6/a0btOw
	xxzZ/MuVDMuiZU3qUmRhtkPcNTLgrIUyn8gzrXFnAU+Y87TCdKsrs2oMeg6O6eWamd9BxFN3R9H
	W+YZ1d0aE92jfjFglzuAFB7PVdGTU9/5rziKdHA3EM+ecrQbLf+DyEi4phvbo
X-Received: by 2002:a05:690e:4514:10b0:670:fe59:3f7d with SMTP id
 956f58d0204a3-67ba502f92amr2477741d50.52.1793464500102; Sat, 31 Oct 2026
 09:35:00 -0700 (PDT)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029-img-pm-autosuspend-v1-1-26851840a34e@linux.spacemit.com> <DMHSRIU2XCB0.35RV6ADY6W1IE@kernel.org>
In-Reply-To: <DMHSRIU2XCB0.35RV6ADY6W1IE@kernel.org>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 1 Nov 2026 01:34:49 +0900
X-Gm-Features: AclHuK-jvh4fcghfPZ1KFb682ZDJ6x2_Cukku_cOj7Mrng853tNlYasYF_Ksjf8
Message-ID: <CAKbEzns6CYjNXmf4jTx_eGSH2j6AjpKJPx=EtoqxweGLiQ85JA@mail.gmail.com>
Subject: Re: [PATCH] drm/imagination: retry runtime idle when firmware is not
 yet idle
To: Troy Mitchell <troy@kernel.org>
Cc: Baihui Liang <liangbaihui@linux.spacemit.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Yixun Lan <dlan@kernel.org>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Baihui, Troy,


On Fri, Oct 30, 2026 at 10:55=E2=80=AFAM Troy Mitchell <troy@kernel.org> wr=
ote:
>
> Hi Baihui,
>
> On Thu Oct 29, 2026 at 4:38 PM +0800, Baihui Liang wrote:
> > Returning -EBUSY from ->runtime_idle() prevents the PM core from
> > retrying the idle check. Schedule an autosuspend so the idle state
> > can be re-evaluated once the firmware reaches ROGUE_FWIF_POW_IDLE.
> >
> > Signed-off-by: Baihui Liang <liangbaihui@linux.spacemit.com>
> > ---
> > Tested on SpacemiT K3 (PowerVR Rogue BXM-4-64) by running vulkaninfo
> > repeatedly. Without this change the device intermittently stayed
> > runtime-active after the last user went away, because the firmware had
> > not yet reached ROGUE_FWIF_POW_IDLE when the idle check ran. With the
> > change the device reliably suspends.
> > ---
> >  drivers/gpu/drm/imagination/pvr_power.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/=
imagination/pvr_power.c
> > index eb4b6ecdf4f..6f38249ffcb 100644
> > --- a/drivers/gpu/drm/imagination/pvr_power.c
> > +++ b/drivers/gpu/drm/imagination/pvr_power.c
> > @@ -434,7 +434,16 @@ pvr_power_device_idle(struct device *dev)
> >       struct drm_device *drm_dev =3D platform_get_drvdata(plat_dev);
> >       struct pvr_device *pvr_dev =3D to_pvr_device(drm_dev);
> >
> > -     return pvr_power_is_idle(pvr_dev) ? 0 : -EBUSY;
> > +     if (pvr_power_is_idle(pvr_dev))
> > +             return 0;
> > +
> > +     /*
> > +      * Firmware not yet idle; reject but schedule autosuspend so
> > +      * runtime_idle() can be retried.
> > +      */
> > +     pm_runtime_autosuspend(dev);
>
> If I read the PM core correctly, when this autosuspend timer fires it
> calls ->runtime_suspend() directly rather than retrying
> ->runtime_idle(), so this looks equivalent to returning 0. Could the
> real issue be the pm_runtime_put() in pvr_watchdog_worker(), which
> perhaps should be pm_runtime_put_autosuspend()?

I think sashiko's point is valid.

Calling pm_runtime_autosuspend() from pvr_power_device_idle() when the
FW is busy only adds a delay, and the device is then suspended without
re-checking idle, and this is effectively the same as
returning 0. I guess it worked in testing because the FW was busy at
pvr_power_device_idle() time but reached idle before the autosuspend
delay expired.

How about moving the pvr_power_is_idle() check into
pvr_power_device_suspend() (and dropping pvr_power_device_idle()), and
returning -EBUSY after pm_runtime_mark_last_busy() if the FW is busy?
The PM core then reschedules the autosuspend regardless of whether the
last put comes from the watchdog or elsewhere, so suspend is retried
until the FW becomes idle.

I think this is the pattern described in
Documentation/power/runtime_pm.rst, section 9 ("If the
->runtime_suspend() callback returns -EAGAIN or -EBUSY ...").

--
Thanks,
Gyeyoung
