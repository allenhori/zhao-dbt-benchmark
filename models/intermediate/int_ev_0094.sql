select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 * 5 as v1,
    p.v5 + 11 as v2,
    p.v3 - p.v5 as v3,
    coalesce(p.v3, 0) + 3 as v4,
    p.v5 + 3 as v5,
    round(p.v3 / 13.0, 4) as v6
from {{ ref('int_ev_0045') }} as p
