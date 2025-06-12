Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8DA29B79A
	for <spacemit@lists.linux.dev>; Thu, 12 Jun 2025 18:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749754655; cv=none; b=CgdC2W5/DMOaQarzfdxl3i0NJVYNq7Yej4hZeSYD6C8HzFdEhD8qpR9PxZPL6fwqB+OLVSuip1a0paf/bsX1HQS84LYVON+UJrrCRd5DRaKuz70jD9PIOqJCylCGqSOW/lD8aU/iLGJa3/Gr1tPT2ar4PUwGRHYO1JPoXCGMRoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749754655; c=relaxed/simple;
	bh=9eDZKkMKnknr9qWRRa5DzD/Ls7bNDjR407jRhY4X0SA=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=sXrpaxt4iy8JgASQdt+Vejq/sjyn9YmTeTu6RIeCTrv8qLM9FLvfOgakKPoc0u3Q0Og6a9zhAw9eGM/bxVaWVChX87L8HH+47Mzu093nWjSecs9m+0VJgTc2/ef8K8UU8A/89VOhXoSvXpMZQTsqG67cLUDnoulI4D81LHeRCNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=oCw5Qw0f; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="oCw5Qw0f"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234f17910d8so14283235ad.3
        for <spacemit@lists.linux.dev>; Thu, 12 Jun 2025 11:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749754653; x=1750359453; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRriOQjwYrLCtkslAVC8UMCVhN/d3luvPuUoipDEo9Y=;
        b=oCw5Qw0feyi4YDui8jnMTst4RMtWJQDHGw4HG/uxpjDWe4aCQ7ccjkHxKtm9G/O/sb
         IqNqiuv2Hud6AxntUIs0WhMbpBvcEE0zSGdvz61ZIZ25O8xBkU+ii7mLK/Jbbwdt7aHw
         1LNFG1dPUki0/HoxMdmfnGTP5uhFXLnaxHAlEiCJLmDImhU2S6tYRLAZ4QdD9s3XRj92
         0mBulKg49dBASF9cmQsMdMxdvyDB9FrQzN11fZ3fw/lym7qJ9m9jE9atQngYd3CvjYUM
         7GDuW7MNo8RMeUfdT5sm1chHPHMnJQo2Tlcc8BjQ80Cfs6ARelyZw3ln5bOOFWlUf0W5
         lvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749754653; x=1750359453;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRriOQjwYrLCtkslAVC8UMCVhN/d3luvPuUoipDEo9Y=;
        b=nlV2VXtyM3Tgd6GlTCeioZSEh/XVUQBkK6g0dFUxQyX+yRWKKXjjhSY7BrTGoi+eRk
         zKjGDht1UMOeJNWbfqeEojf3NRRWcqRMwbpIEnJeAU4ct0JOCQby29k4CwO3w2S3CVdF
         mzV7V3lVOJ7pn7XZu6oNZId+yCsmgpFvHhjugIq2DwhHEoc5qyPGhnSHEuyYil+mjvpF
         Rk39/Ct7SYHyP/o+z5UpDBGVzyij6o3PkB4SS/sbhpRQPgq6qNNCHs5rEOS3tJtwEDB6
         DC1NpREmDQ4iTVWJjaQEKvbicWZvALFFw8T+oedQomPtp2tgb3mol6ac/JKxa8QTuY9+
         vWog==
X-Forwarded-Encrypted: i=1; AJvYcCUyqPySTOkxosw1OhjCzwbdaFFOHiw+RUZm9pLX2heZjaXFKdZmAtHvUM06pHh7wGxdW8TYV4IsHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVmDSoGa2UF8TaCwnANWhse8Ei/qnCIBX+rR+fuBTae8hqzdsp
	HlvHY0hFV0hWt6PNp8Eaz+1d8KbDIPGvJPD5xLajJt7vVvjYyGlLbT0G8hps0CaU464=
X-Gm-Gg: ASbGncu2LV/dhH6iMtrO53f74YzgeYw2/oRnpTQimf0KkK8nVSq1JfrLQDBLFDz11T+
	Xt9QnWSqf5bX/7Ber+iD4MNDoKHVhsnyHIDj14jX/LdXKOl++dLZkR97M+bOz1hyQQyAFQkfPrK
	q2nz/wVjm06unsNRm+oNY/Z/TLRAm7o907FWxag0961cx+WQDAh2H2nw/Xwly7b6A4NnuEceEfY
	TRYZiPSDf3K0Kw9rfIgBbvL7VA41msVrzKzp2qOZqKRSMcLCHJ/P7apzq+WVOSnhxxOnf0ifi80
	k+83/0KYC/7JnFEQ6FvMuCEjUvr1p045Rd24Iflzp5EYi0uwW68srqB/ZYeF
X-Google-Smtp-Source: AGHT+IHb1WoqMR2DTGzMl28JEVGljgw7Pu+7yw8Q/cYEW3M+CVBNmCMmaIsDvjDf9/pnPWIpZxZksQ==
X-Received: by 2002:a17:903:2305:b0:235:e1d6:4e45 with SMTP id d9443c01a7336-2365da06422mr2349555ad.25.1749754653208;
        Thu, 12 Jun 2025 11:57:33 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d8a4278sm625105ad.78.2025.06.12.11.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:57:32 -0700 (PDT)
Date: Thu, 12 Jun 2025 11:57:32 -0700 (PDT)
X-Google-Original-Date: Thu, 12 Jun 2025 11:56:53 PDT (-0700)
Subject:     Re: [PATCH] riscv: defconfig: run savedefconfig to reorder it
In-Reply-To: <221b0b7c-1879-4944-b9c4-cfb9fad9ae91@ghiti.fr>
CC: dlan@gentoo.org, Conor Dooley <conor@kernel.org>,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, guodong@riscstar.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <mhng-131B0C4B-6AD9-4B65-BC91-927FD725E63F@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 12 Jun 2025 06:12:09 PDT (-0700), Alexandre Ghiti wrote:
> On 6/12/25 11:32, Yixun Lan wrote:
>> Hi Alexandre,
>>
>> On 10:37 Thu 12 Jun     , Alexandre Ghiti wrote:
>>> Hi Yixun,
>>>
>>> On 6/11/25 16:56, Yixun Lan wrote:
>>>> Changes to defconfig should be always updated via 'make
>>>> savedefconfig', run this command to make it aligned again.
>>>>
>>>> This will ease the effort of reviewing changes of defconfig
>>>> in the future.
>>>>
>>>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
>>>> ---
>>>> Update PDMA config bring in unnecessary changes[1], let's fix
>>>> it by run savedefconfig first.
>>>
>>> It would be easier if this patch was part of the PDMA series since the
>>> last patch will depend on it: @Guodong can you integrate this patch to
>>> your next revision of your patchset?
>>>
>> I'd rather make this patch independent, as nothing strongly ralated with PDMA,
>> and it probably would take several rounds for PDMA patch to be settled down..

Ya, I agree.

>> Besides, there is no problem for PDMA patch to depend on this patch if
>> needed (easy to use b4 to handle this..)

Yep, something like "b4 shazam -lts --merge --merge-base 958097bdf88"
should do it on the merge side -- and maybe you don't even need the 
merge base, if all the b4 send side stuff picks it up right.

>> The idea here is to get this patch merged as early as possible, as it's
>> quite straightforward, and other people may have similar problem instead
>> of PDMA here
>
>
> Ok makes sense, so let's Guodong deal with that then.

(for some reason this isn't showing up in patchwork)

I'm going to merge it as a single patch into for-next.  It'll loop 
through the tester, but things look in good shape so it shouldn't take 
too long.  This way there's a stable hash people can base stuff off, 
rather than waiting for some other patch set.

>
> Thanks,
>
> Alex
>
>
>>
>>> Thanks,
>>>
>>> Alex
>>>
