Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAF4432304
	for <spacemit@lists.linux.dev>; Wed, 12 Aug 2026 23:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577722; cv=none; b=SzU53iAN79/3sq6ZKZmPwes/pkgh52bm+V9/BLBEPvqD4oZaEWBYOXvVDTBSGe9aMHowgIIpoLBRLO+jkTyN5fgM2fVMYhbHX2eMUAEeqfYttF+7zsEotos90UaV2gl2nZH1z20mnNn38u4fGg872t3iSfgNP5grgPmJbkSTthY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577722; c=relaxed/simple;
	bh=df+eBxBrANzUqAkDxq/LIOvp8cwE4dtT4e7eHOHJASw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EK/kMXgLNTuucu07eguFBuim1+zts1O6uLs7AbZq2KCYZfzvs/6svO6h0Xxe9JqjJGDtUKiz3gSgku405DgEk6XG7XSGzIcJCL+JnSI3J7WvS5Ru0GY/P4Eliyxi68AAexEjKzgP5tvbjxkMR3K4s3yKSKMhkExXuQo5sKhNpl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRVSFQ47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frWZxXns; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRVSFQ47";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frWZxXns"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNM1TH4008757
	for <spacemit@lists.linux.dev>; Wed, 12 Aug 2026 23:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ew7essRfW4CKu/wg5LnPI4usVo+eyUYoe/mBBDpBn4=; b=QRVSFQ47/HfFj+l5
	1NZcpNhH7D+NfqSPF8QVnXbaf5oeLkC2iCGcqnpkNvYm5pXkI9msqwKdEFoZpFes
	Ieqiqj/8LByLIG1GwqMz1f/C+z0DItXQw2vicLrDlSCXPlseo8tZ0uJ8wcMsv3Zi
	VtLf5PUfW9PvmlrSdUqX6/4R1DIPyp47XdohzGLgSgI24v/r2aT+Is/hyxUJBR+i
	GeUfKVvvWJXyG9xLYmi9+THEo8L2T0tp+fv/+s+mgLr73oVH0NXxCCGG8K4839gE
	EkgPTDywrjy3ElT4GWqtVWtFzmJKv5AryJ7alo/+nmBIGcJ0DH5BPSKWIsjAkiP0
	i6OvSw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0xsk0vc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Wed, 12 Aug 2026 23:35:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d001671a54so3573975ad.2
        for <spacemit@lists.linux.dev>; Wed, 12 Aug 2026 16:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577719; x=1787182519; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ew7essRfW4CKu/wg5LnPI4usVo+eyUYoe/mBBDpBn4=;
        b=frWZxXns1ITjwqmBOnZd6wlDc4qi0uUO465vWibIdUWOkOj8CVycTyxpME3q013rMr
         QdYI5L3iIKM9OOOlYO5RTEYSgHFd4pepbzbdlEYemxbnfjFg0LL8iqdfXzN97OkhMiZK
         T3EfgMcN/LMgA++QFiJG6DqkkeeEgoeai9oPvS5H9tVqSI6+I5scgGYu3pbKu+xciCpp
         qT1vUgCUx83U9tKFJEI7teZIrYjJIHz+D3oocsPz/OZH9ku1tIxfDtqrxgn3SQIBTHb7
         HoepGrTztm7IfkfRP2+wPc3aMNOIE2hwbdmqAdDUyxKdZNDCj10Hq7IWi7dDM6/aTBhE
         GUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577719; x=1787182519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ew7essRfW4CKu/wg5LnPI4usVo+eyUYoe/mBBDpBn4=;
        b=OrSAo3VxJwt92SWANw/oZsN5yHTPmyBYRF3WxuB6FhTOdMZwBt9YS7erVRdADexPlD
         6zzT1WL7NYWjvmmkuoiGShGOWgq3FidaG9DI87U4javQNnaKjhSUrxn+NmKyiPrMlQUi
         2e7HuYDTGNbJY5HMS0YnThezfNHAdKK2XfQYpM2p2FMspwUnkOmalRXEkm5sCEqCg77F
         hMOmf0galIC/MEPnbWgGxWEi01DM9cXEZcxJXbsox1ZvOGIAkkW4QHcZWIYVsmVyaA2K
         wmsDVQQGvJNIb6APQNBY35F8/GCQx4negIcN0oOdtln580xdZ3IScIcVVuiCmLYfvEBs
         halg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2o8SBu+ZEpDTV1s1TWNMq/1DI5A1B0NygnWW1BSafC6tM5GMGhcIWZdQ4NaUSxEMFqfhb4ic/rA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPHahwcZeDCd5I9lQbJNT/VwakcyzXQ/6ODjihKLU1BWD0HtQP
	OIJ+f4t1wRMC9Z4rFGO9PfBpCMVHSXQBuFisLV4NNcPc9ndFntAn+ZFM1RR/p6tEYK8oEcwUG7k
	ogUCbCobak3T0WEGx83kQBjkcIvkmSkJ2WMh7nTHWM80EHKntPKn3IVjQUsAD7w==
X-Gm-Gg: AR+sD13+YGkvR2B4A7qfjg+QWdzk43Z3+4yuncim7MKfJ9Xs36/Ny1aoBr4VfzwNiMS
	9ZoS27Ihs3Uqt0jNe4FbmdA4vrEw8+dMI1rNO5gbdlQcrYAmOvp/0WkgK1inmnhKilqwNX8Lhe2
	GHUjFNQMFOuD4GN97Hpwf+cuKxhxu8V60/fPBv3Bo9T/ZhMEj4E2EJFZHr4yBcGBrVH2USVNwbh
	lDq/uPFaLpPVnGO3KftyOT//XPinBXIN8JqQYeOayfhU0/nb4mm4Due4/hXL4BBh3wIlcJnCcdF
	ZEopkdr7pn787tAN+8JWqoJ6EYqc9dxUn9MKVrm/3LpKaop+rU1CQ/fM7QHeXw==
X-Received: by 2002:a17:902:f651:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d37d581162mr19111155ad.8.1786577718846;
        Wed, 12 Aug 2026 16:35:18 -0700 (PDT)
X-Received: by 2002:a17:902:f651:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d37d581162mr19110515ad.8.1786577718418;
        Wed, 12 Aug 2026 16:35:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:18 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:49 -0400
Subject: [PATCH v6 03/11] dt-bindings: riscv: Add Zic64b extension
 description
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-3-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2714;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=df+eBxBrANzUqAkDxq/LIOvp8cwE4dtT4e7eHOHJASw=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZpGghL0lKZNWVsyfs/b09AnNXKwq7Ue3Jb5z3bP1V
 bmp1L69HaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjCRVHtGhs7zvq3twu+tnrx1
 cD9TvWg1n87SC7vz+1NusSjfZ/ed2sjIcEBQY4v9Xc3WDZeKznt5ss3XPXZa67/EvvcOlyzzb9n
 t5wIA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: KRFjb7lj0FQjwJXe7qHmh3OZkwJ1Y74r
X-Authority-Analysis: v=2.4 cv=M7J97Sws c=1 sm=1 tr=0 ts=6a7d0337 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=B0juqsJzrbe9EOqzv1oA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfXy+U/SUzbzvEa
 6J/DRtW1TP3pDTc+g20LRPLhn0XUH9g75QfM0lsW/urpsYR52rosiWiY9AOCntTeASr9fen9IR6
 Wzlz6Up7/zsG/5OquH8xNtKVC66whzs=
X-Proofpoint-ORIG-GUID: KRFjb7lj0FQjwJXe7qHmh3OZkwJ1Y74r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfXw56SX+fJ+OVv
 QKXMLN+OwFrcKyL8Vclo45rbBMp9Gt9wnab8lHwUWQjt/FzYYZFAk8jikdUSD45N15E0EiPGllg
 zykf4wUJUvSBm5vWb1AI1Zd/Cf0Bh1A3UO9OsaMjZUS1CkP0ofR0hzTE77I4ZO3n3Lv9EvutcLR
 e/SZbaqFqktMMyii/H4pz9G7O3mDu9nz8p0w1RS9sJ92BpWYm45UUHy18b++bdmmvzvzG3nQr5v
 L23GwdJ0HDkIdit/gtPZ0DoQahdCPRZubvXBmAypIxsG9PmKCnvFuEt4l/ESPBNvFysuvrU5r7b
 4uod0Po7doYRZk/9/6dso+9mA9IWRjYgrQseaxp3x50e9o4MiE592qI15fcP8+X996FOtMopnFE
 8jJ1NEF/3i7UTPe/2Dbr72M1xjaprKlndtrpvUDGRdWb+xTuMpWmaGCqyClsONAJqmL5JWGz9Fe
 et8syHI/5Y4Jqm7v+tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190

Zic64b mandates that cache blocks are 64 bytes in size and naturally
aligned in the address space. It is a mandatory extension of both the
RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
Profiles Version 1.0.

Document it so it can be described in the riscv,isa-extensions property,
alongside the related Zicbom/Zicbop/Zicboz cache-block extensions. Since
Zic64b fixes the cache block size at 64 bytes, also add a schema check
requiring any present cbom/cbop/cboz block size to be 64. The check
matches only nodes that use riscv,isa-extensions, so nodes carrying
just the deprecated riscv,isa string are not affected.

Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: Guard the zic64b rule with required: riscv,isa-extensions so it
    cannot match nodes using only the deprecated riscv,isa string
    (same defect class as Rob's bot reported against the Zicbo*
    block-size patch).
v5: Commit message clean up, fix a double space (Conor).
v4: Insert zic64b at its sorted position (before zicbom).
    Update the commit message.
v3: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index d4cde2a7b8b2..79491ef8f86a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -537,6 +537,12 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: zic64b
+          description:
+            The standard Zic64b extension for 64-byte naturally aligned cache
+            blocks, as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
         - const: zicbom
           description:
             The standard Zicbom extension for base cache management operations as
@@ -1211,6 +1217,22 @@ allOf:
           not:
             contains:
               const: zilsd
+  # Zic64b mandates 64-byte naturally aligned cache blocks
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zic64b
+      required:
+        - riscv,isa-extensions
+    then:
+      properties:
+        riscv,cbom-block-size:
+          const: 64
+        riscv,cbop-block-size:
+          const: 64
+        riscv,cboz-block-size:
+          const: 64
   # All three Zicbo* extensions require their block size property as there's no
   # default.
   - if:

-- 
2.43.0

