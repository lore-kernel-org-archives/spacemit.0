Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330169;
	b=gYrD8AhwCSpmntRCQwwFCTf7QJWXVmUn1kf4X+dOLI9oQpg+ogV95YKjUVey1iMyeHbd
	 ItvErzvIGmsCOUkmkCU0NuVM02qULG3UAAMs7sLXqEogoJTHKmom4+JR8JlSKRfV8QJ1I
	 MW+JCG27Mvaw7RkhbZ6T1QZcTME18E363orC3bYZUufIkWoOdfq34QHbesHTj45XwFliR
	 gcenLk7ZYC3HZIXtzmzO1q9TTGWulIb4W8/ywoIyJAz/q4VQ8XvZ5oYaT7kC7zvCyCEaO
	 w8b7rp5H803ltpvBRvdFtrAv9x41NEfvdGbHZ7Kp0KGlKTZLylLhoimQ7tdYD2Rsd9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330169;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:To:Cc:References:Subject:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ozoC35JH09JXF0SoFXDETE/OXFxO44zArTqmVJlRrnw=;
	b=BjCLVBzTrwdS9b34Da5WRFH0rrcPawp0xjyz1k99dC8oNMTqQPXJh/U9LbiBHaBCPPNS
	 W4IadRWmZ3O1g9BhQWDZObxdUgw+LuSm6Hdi0jA7q0+bSGfy5b1wBgYRDFhvRul9UsoKI
	 Z3UEl1Fuxw95+XopnHvhMBC3tC1aPlBzzys1MLGiiQAx59jmYhuos+Uf1LQDrBIYu5mpa
	 V8KAL5MMpsXl6DMCqxqpsEsS/RlDgSZpKsnxvEpF5HK4ig8LQft+u/h38aRvYkhHC6TqI
	 ODdU+XmWeCoTsdY0MJnB9ZXujBDPYmbebiEpw8Hsvu68zhFiiufgV0Kj0oQlLCQwMQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=hQD9mPgX;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E64606A323
	for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 17:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6E64606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=hQD9mPgX
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 12E0A4026F
	for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 17:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794330166;
	bh=ozoC35JH09JXF0SoFXDETE/OXFxO44zArTqmVJlRrnw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type;
	b=hQD9mPgXugfhtIhDcvsq4SZThekNRzFT3sMIjicEtPufbY6ARxAAxLQP9WwXgY4CC
	 aR/wvfhIAOuf3xGqJZo7ygWk+aKNtZBVp7lmCnO9LJjMhM5KrxcmeB8bpIIiHRMrzY
	 PrQkHf/lANfXuOSU36xUjcvWW5YuG7yc9cPxFeqpveHCwXebfEbaeOUTnysB/U1Bfa
	 CPGExOBT+QlJol/ka/7z/wx722r0mcwCR5XGgD0Q5CsXjt2jIbL03XUfyNoMmsSoTh
	 azWcf7ngIBV/oFBaUnd03Yo25hSnHRyOScMrPajLZzJy5tRQmcPlyGJChgcodsy58N
	 FmaWQlVn+De1Ouo/qWit8uxUXwv+CoTiMTgzmtBj9+o9QGitYLGM8c7Q/jbx1Yas5Y
	 Y/48ZWEGk1Yw3ZMsowhzD+KSuKGreYgOQSxMwuhcsT8w3gjGieQ12dOUI6ZXkWpzhG
	 8sMIACnv7Y4gRSVmbu8/sq3RVbNdvF6kvTeBTqiOTSECV65jVm7E9GQMzEHXuE4I6+
	 4yxISxem7RcOd1JlrFHtBjJWAIfBc13cDpxb24Pe6pnOiyz2sJ0yOQF8Nn30Xsj4Se
	 9g6K+eeCapUKBWNEHlb7hd/cxrT1Mr+c02r8iPBVBUvKS9yvI67OBzeGZE5fHy1WgH
	 wOfMNs7ArNDVqstymZ1zmUTA=
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e00f3929bso1362195f8f.0
        for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 09:02:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794330165; x=1794934965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozoC35JH09JXF0SoFXDETE/OXFxO44zArTqmVJlRrnw=;
        b=h/K80di1JnD7UtB5bDP+Tfwo0re1nXshB2uKQObT+lFqPeEQ58lAf8Y7RsL3M0m7u5
         3eEkYhhbg8gdiyEhz3OfUn1S9pbezx9syUU0XtRtT7aMQnml7Yv0WyG37i5ZPxpNB3YB
         iZW4tCV/DFSs0I7BLHWEWD/oubxf3WOU8BNT4/eGHvEoSrHyFmzwQWa3EHr8imziQVQl
         S/aKctLpA62djMWgQ5tApv7Y1MG682FPQ8sXUVlovP8r036C25pLrU4vC7oG1mekO6JP
         8+d7mZJkuxeKk7vOdHWi4VvsicB9X0ncbQ2X16EBp6TISyssfY2F3T/zHC81nZcMOFUQ
         BR/g==
X-Forwarded-Encrypted: i=1; AL+hErGjtEn1WH3JJhh90/c5uBtJxKR871zVZHTgYffWHO8i29SLvOhEsBXUcEfrgY3P9uKis9CkdT2t2A==@lists.linux.dev
X-Gm-Message-State: APuU4Z+ESzm4ITPG9AYm1j+qa+/9ZPlUcZrfyhQjh2gqQyzWFFxwm2i2
	LWBvE97AOrn2OjBMuWE3u/n/tLyby6okjN58exHNVRWnPp4tI45ZpBa0P6Inhd0pysegY5F1xcn
	yAMHIxcrMNRom1xuJX4B+54UgruZdq7q+3mtKh0t68UbnqI7KIxIm1o2j7lg1levP1rFZIASW6q
	dx
X-Gm-Gg: AYBFou2UBKzmkPgFqD+u6c0U7xhOrEju/yOXa/8niLUB8DXip/CK9Vpm12Q7WdOr5/7
	oZGyni602mPKMnECU4aSb0nB9YHnMVa5YXjVn7T9WG3Ynx7qddhc/rbWFKaz8G9tXicNy2Tn4UU
	ld9DZHbvmIe/GMIU6dLkQJOUqdd5NupxpIKgvs+9YVE9YPJzPyiynO0EM6Aoaake1haEvSUsOZc
	KEFIDAye82vZEmriD3nZz5RpMxUKJ0DKHC5zeD7SfG5DcT1dcA2LlNdSQpJK4O4lG2GsSdNiFFP
	ONKT9aX8rKwqR8Ncz4JdkTx54Ap6Kz9BRfMD54KpNlGl1YLJcX7GiLJAxu++hxRsUzA3ZINpL2r
	4Y/GehxTm56PKAWb1Pr9d9ZbpIba6VCIAyYx209/X+cVVsddUQmv0u+u7pj5A+4Y/dLp+9qR2Ln
	HgLJJcrgjRB3eQDHVI+fUxsO8caI5inXDgXyELvRN1AjZJwbunZhih
X-Received: by 2002:a05:6000:607:b0:48e:eb:56c5 with SMTP id ffacd0b85a97d-49992cc6a24mr288601f8f.8.1794330165611;
        Tue, 10 Nov 2026 09:02:45 -0800 (PST)
X-Received: by 2002:a05:6000:607:b0:48e:eb:56c5 with SMTP id ffacd0b85a97d-49992cc6a24mr288536f8f.8.1794330165190;
        Tue, 10 Nov 2026 09:02:45 -0800 (PST)
Received: from ?IPV6:2a01:cb19:9432:11ec::c98? (2a01cb19943211ec0000000000000c98.ipv6.abo.wanadoo.fr. [2a01:cb19:9432:11ec::c98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836c83432sm5386247f8f.58.2026.11.10.09.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:02:44 -0800 (PST)
Message-ID: <546efd00-ddaf-47f4-9387-2635785a1bf5@canonical.com>
Date: Tue, 10 Nov 2026 18:02:42 +0100
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: devnull+codykang.hk.gmail.com@kernel.org
Cc: airlied@gmail.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bmasney@redhat.com, codykang.hk@gmail.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dlan@kernel.org, docular.xu@gmail.com,
 dri-devel@lists.freedesktop.org, heylenay@4d2.org, krzk+dt@kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, me@ziyao.cc, mripard@kernel.org,
 mturquette@baylibre.com, neil.armstrong@linaro.org, p.zabel@pengutronix.de,
 palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org, sboyd@kernel.org,
 simona@ffwll.ch, spacemit@lists.linux.dev, tzimmermann@suse.de,
 u.kleine-koenig@baylibre.com, vkoul@kernel.org
References: <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
Subject: Re: [PATCH v2 11/17] drm/spacemit: add Saturn DPU DRM device driver
Content-Language: en-US
From: Sarah Emery <sarah.emery@canonical.com>
In-Reply-To: <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

We have incorporated this patchset into the Ubuntu kernel for display 
support on the K3 platforms.

During testing, we found an issue: the screen would display artifacts 
all over, kind of like black lines blinking.

I have implemented the following patch to fix the issue:

drm/spacemit: map scanout buffers write-combining

The K3 display controller is not DMA-coherent: the DPU fetches scanout
buffers straight from memory while fbcon and userspace write them through
a cached CPU mapping. The shmem helpers clean the buffer only once, when
the sg table is first built, so nothing flushes later CPU writes. Dirty
cache lines shadow what the DPU scans out, and erased fbcon text lingers
on screen until the lines are evicted by chance.

Add a gem_create_object() hook that sets map_wc on the shmem objects.
The K3 harts implement Svpbmt, so the CPU mapping becomes genuinely
non-cacheable and writes reach memory immediately; the one-time clean in
dma_map_sgtable() still covers the initial contents.

---
  drivers/gpu/drm/spacemit/spacemit_drm.c | 16 ++++++++++++++++
  1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/spacemit/spacemit_drm.c 
b/drivers/gpu/drm/spacemit/spacemit_drm.c
index 12b2fe8b6fc99..fe354219b996d 100644
--- a/drivers/gpu/drm/spacemit/spacemit_drm.c
+++ b/drivers/gpu/drm/spacemit/spacemit_drm.c
@@ -12,6 +12,7 @@
  #include <drm/drm_fbdev_shmem.h>
  #include <linux/component.h>
  #include <linux/of_graph.h>
+#include <linux/slab.h>

  #include "spacemit_drm.h"
  #include "spacemit_crtc.h"
@@ -75,6 +76,20 @@ int spacemit_drm_mode_config_init(struct drm_device *drm)
         return 0;
  }

+static struct drm_gem_object *spacemit_gem_create_object(struct 
drm_device *drm,
+                                                        size_t size)
+{
+       struct drm_gem_shmem_object *shmem;
+
+       shmem = kzalloc_obj(*shmem);
+       if (!shmem)
+               return ERR_PTR(-ENOMEM);
+
+       shmem->map_wc = true;
+
+       return &shmem->base;
+}
+
  DEFINE_DRM_GEM_FOPS(spacemit_drm_fops);

  struct drm_driver spacemit_drm_drv = {
@@ -82,6 +97,7 @@ struct drm_driver spacemit_drm_drv = {
         .fops = &spacemit_drm_fops,

         DRM_GEM_SHMEM_DRIVER_OPS,
+       .gem_create_object = spacemit_gem_create_object,
         DRM_FBDEV_SHMEM_DRIVER_OPS,

         .name           = DRIVER_NAME,
--

I'm sending this here in the hope that it will be useful for a future 
revision.
Is there a v3 in preparation?

Thanks,

Sarah
